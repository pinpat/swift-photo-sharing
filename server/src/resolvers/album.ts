import { IResolvers } from "graphql-tools";
import { Album } from "../entity/Album";
import { Attachment } from "../entity/Attachment";
import {generateFileUrl} from "../file";
import moment from "moment";
import { Image } from "../entity/Image";
import { Sharing } from "../entity/Sharing";

export const resolvers: IResolvers = {
    Query: {
        findAllAlbum: async (_, __, { user }) => {
            if (!user) {
                throw new Error("Access denied!");
            }
            let albums = await Album.find({
                relations: [
                    "author",
                    "images",
                    "images.image",
                    "images.audioWho",
                    "images.audioWhen",
                    "images.audioWhere"
                ],
                where: {
                    author: {
                        id: user.id
                    }
                }
            });
            
            const sharing = await Sharing.find({
                relations: [
                    "album", 
                    "author",
                    "album.author",
                    "album.images",
                    "album.images.image",
                    "album.images.audioWho",
                    "album.images.audioWhen",
                    "album.images.audioWhere"
                ],
                where: { author: { id: user.id } }
            });

            albums = [...albums, ...sharing.map(item=>item.album)]
            albums.map(album => {
                if(album.images.length){
                    album.images = album.images.map((image: Image) => {
                        image.image.url = generateFileUrl(image.image.name, moment().add('1', 'day').unix())
                        if(image.audioWhen){
                            image.audioWhen.url = generateFileUrl(image.audioWhen.name, moment().add('1', 'day').unix())
                        }
                        if(image.audioWhere){
                            image.audioWhere.url = generateFileUrl(image.audioWhere.name, moment().add('1', 'day').unix())
                        }
                        if(image.audioWho){
                            image.audioWho.url = generateFileUrl(image.audioWho.name, moment().add('1', 'day').unix())
                        }
                        return image
                    })
                }
            })
            albums[0].images.map(item => console.log(item))
            
            return albums
        }
    },
    Mutation: {
        saveAlbum: async (_, { name }, { user }) => {
            let newAlbum = new Album();
            newAlbum.name = name;
            newAlbum.author = user;
            newAlbum.shareCode = Math.random()
                .toString(36)
                .substr(2, 8)
                .toUpperCase();
            return await Album.save(newAlbum);
        },
        deleteAlbum: async (_, { id }, { user }) => {
            const album = await Album.findOne({
                relations: [
                    "author",
                    "images",
                    "images.image",
                    "images.audioWhen",
                    "images.audioWhere",
                    "images.audioWho"
                ],
                where: { id, author: { id: user.id } }
            });
            if (!album) {
                throw new Error("Album not found!");
            }

            let ids = [
                ...album.images.reduce(
                    (init, image) =>
                        image
                            ? [
                                  ...init,
                                  ...(image.image ? [image.image.id] : []),
                                  ...(image.audioWhen
                                      ? [image.audioWhen.id]
                                      : []),
                                  ...(image.audioWhere
                                      ? [image.audioWhere.id]
                                      : []),
                                  ...(image.audioWho ? [image.audioWho.id] : [])
                              ]
                            : [...init],
                    new Array<number>()
                )
            ].filter(_ => _);
            new Attachment().removeFile(ids);

            return await album.remove();
        },
        findAlbumById: async (_, { id }, { user }) => {
            return await Album.findOne({
                relations: [
                    "author",
                    "images",
                    "images.image",
                    "images.audioWhen",
                    "images.audioWhere",
                    "images.audioWho"
                ],
                where: { id, author: { id: user.id }, images: { id: user.id } }
            });
        }
    }
};

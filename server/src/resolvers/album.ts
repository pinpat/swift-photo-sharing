import { IResolvers } from "graphql-tools";
import { Album } from "../entity/Album";
import { Attachment } from "../entity/Attachment";

export const resolvers: IResolvers = {
    Query: {
        findAllAlbum: async (_, __, { user }) => {
            if (!user) {
                throw new Error("Access denied!");
            }
            return await Album.find({
                relations: ["author","images"],
                where: {
                    author: {
                        id: user.id
                    }
                }
            });
        }
    },
    Mutation: {
        saveAlbum: async (_, { name },{user}) => {
            let newAlbum = new Album();
            newAlbum.name = name;
            newAlbum.author = user;
            newAlbum.shareCode = Math.random().toString(36).substr(2, 8).toUpperCase();
            return await Album.save(newAlbum);
        },
        deleteAlbum: async (_, { id}, {user}) => {
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
                    (init, image) => image? [
                        ...init,
                        ...image.image? [image.image.id]: [],
                        ...image.audioWhen ? [image.audioWhen.id]: [],
                        ...image.audioWhere ? [image.audioWhere.id]: [],
                        ...image.audioWho ? [image.audioWho.id]: []
                    ]: [...init],
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
                where: { id, author: { id: user.id }, images: {id: user.id} }
            });
        }
    }
};

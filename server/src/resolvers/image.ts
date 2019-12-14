import { IResolvers } from "graphql-tools";
import { Album } from "../entity/Album";
import { Image } from "../entity/Image";
import { Attachment } from "../entity/Attachment";
import { generateFileUrl } from "../file";
import moment = require("moment");

export const resolvers: IResolvers = {
    Query: {
        findAllImage: async (_, __, { user }) => {
            if (!user) {
                throw new Error("Access denied!");
            }

            return await Image.find({
                relations: ["image", "author", "album"],
                where: {
                    author: {
                        id: user.id
                    }
                }
            });
        }
    },
    Mutation: {
        findAllImageByAlbumId: async (_, { albumId }, { user }) => {
            return await Image.find({
                relations: ["image", "author", "album"],
                where: {
                    album: {
                        id: albumId,
                        author: {
                            id: user.id
                        }
                    },
                    author: {
                        id: user.id
                    }
                }
            });
        },
        saveImage: async (_, { imageId, albumId }, { user }) => {
            const album = await Album.findOne({
                where: { id: albumId }
                // where: { id: albumId, author: { id: user.id } }
            });
            if (!album) {
                throw new Error("Album not found!");
            }
            const image = await Attachment.findOne({
                where: { id: imageId, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("File not found!");
            }
            let newImage = new Image();
            newImage.image = image;
            newImage.album = album;
            newImage.author = user;
            return await Image.save(newImage);
        },
        saveAudio: async (_, { id, audioId, type }, { user }) => {

            if (!["audioWhen", "audioWhere", "audioWho"].includes(type)) {
                throw new Error("Type not found!");
            }
            const image = await Image.findOne({
                relations: ["audioWhen", "audioWhere", "audioWho", "image"],
                where: { id }
                // where: { id, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("File not found!");
            }
            const audio = await Attachment.findOne({
                where: {
                    id: audioId,
                    author: { id: user.id }
                }
            });
            if (!audio) {
                throw new Error("File not found");
            }
            console.log(type,image);
            
            switch (type) {
                case "audioWhen":
                    if(image.audioWhen){
                        await new Attachment().removeFile([image.audioWhen.id])
                    }
                    break;
                case "audioWhere":
                    if(image.audioWhere){
                        await new Attachment().removeFile([image.audioWhere.id])
                    }
                    break;
                case "audioWho":
                    if (image.audioWho) {
                        await new Attachment().removeFile([image.audioWho.id])
                    }
                break;
                default:
                    break;
            }

            let newAudio = { ...image, [type]: audio };
            image.audioWhen = newAudio.audioWhen
            image.audioWhere = newAudio.audioWhere
            image.audioWho = newAudio.audioWho

            return await image.save()
        },
        deleteImage: async (_, { id }) => {
            const image = await Image.findOne({
                relations: ["image","audioWhen", "audioWhere","audioWho"],
                where: { id }
                // where: { id, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("image not found!");
            }
            
            const ids = [
                image.image.id,
                image.audioWhen && image.audioWhen.id || 0,
                image.audioWhere && image.audioWhere.id || 0,
                image.audioWho && image.audioWho.id || 0
            ].filter(_ => _);

            new Attachment().removeFile(ids);

            const result = await image.remove();
            
            return {...result, id: 0}
        },
        findImage: async (_, { id }) => {
            const image = await Image.findOne({
                relations: [
                    "image",
                    "author",
                    "album",
                    "audioWho",
                    "audioWhen",
                    "audioWhere"
                ],
                where: { id }
            });
            if(!image){
                throw new Error("Image not found!")
            }

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
        }
    }
};

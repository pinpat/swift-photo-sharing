import { IResolvers } from "graphql-tools";
import { Album } from "../entity/Album";
import { Image } from "../entity/Image";
import { Attachment } from "../entity/Attachment";

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
                where: { id: albumId, author: { id: user.id } }
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
        saveAudio: async (_, { imageId, audioId, type }, { user }) => {

            if (!["audioWhen", "audioWhere", "audioWho"].includes(type)) {
                throw new Error("Type not found!");
            }
            const image = await Image.findOne({
                where: { id: imageId, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("Image not found!");
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

            let newAudio = { ...image, [type]: audio };

            return await Image.update(
                {
                    id: imageId,
                    author: {
                        id: user.id
                    }
                },
                newAudio
            );
        },
        deleteImage: async (_, { id }, { user }) => {
            const image = await Image.findOne({
                where: { id, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("image not found!");
            }

            const ids = [
                image.image.id,
                image.audioWhen.id,
                image.audioWhere.id,
                image.audioWho.id
            ].filter(_ => _);

            new Attachment().removeFile(ids);

            return await image.remove();
        },
        findImage: async (_, { id }, { user }) => {
            return await Image.findOne({
                relations: [
                    "image",
                    "author",
                    "album",
                    "audioWho",
                    "audioWhen",
                    "audioWhere"
                ],
                where: { id, author: { id: user.id } }
            });
        }
    }
};

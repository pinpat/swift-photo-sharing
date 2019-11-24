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
                relations: ["gallery", "author"],
                where: {
                    author: {
                        id: user.id
                    }
                }
            });
        }
    },
    Mutation: {
        saveAlbum: async (_, { name, attachmentId },{user}) => {
            const gallery = await Attachment.findOne({
                where: { id: attachmentId }
            });
            if (!gallery) {
                throw new Error("File not found!");
            }
            let newAlbum = new Album();
            newAlbum.name = name;
            newAlbum.gallery = gallery;
            newAlbum.author = user;
            return await Album.save(newAlbum);
        },
        deleteAlbum: async (_, { id}, {user}) => {
           /* const user = await User.findOne({ where: { id: authorId } });
            if (!user) {
                throw new Error("User not found!");
            }*/


            const album = await Album.findOne({
                relations: [
                    "author",
                    "gallery",
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
                album.gallery.id,
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

            //return await Album.delete({ id, author: { id: authorId } });
        },
        findAlbumById: async (_, { id }, { user }) => {
            return await Album.findOne({
                relations: [
                    "author",
                    "gallery",
                    "images",
                    "images.image",
                    "images.audioWhen",
                    "images.audioWhere",
                    "images.audioWho"
                ],
                where: { id, author: { id: user.id } }
            });
        }
    }
};

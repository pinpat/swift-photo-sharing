import { IResolvers } from "graphql-tools";
import { Album } from "../entity/Album";
import { Sharing } from "../entity/Sharing";
import { Not } from "typeorm";

export const resolvers: IResolvers = {
    Query: {
        findAllAlbumByAuthor: async (_, __, { user }) => {
            const sharing = await Sharing.find({
                relations: ["album", "author"],
                where: { author: { id: user.id } }
            });

            return sharing && sharing.length
                ? sharing.map(item => item.album)
                : [];
        }
    },
    Mutation: {
        addAlbumShare: async (_, { shareCode }, { user }) => {
            const album = await Album.findOne({
                where: { shareCode, author: { id: Not(user.id) } }
            });
            if (!album) {
                throw new Error("Album not found!");
            }
            let sharing = await Sharing.findOne({
                relations: ["album","author"],
                where: { author: { id: user.id }, album: {id: album.id}}
            });

            if (sharing) {
                throw new Error("Sharing already exist!");
            }

            sharing = new Sharing();
            sharing.author = user
            sharing.album = album
            return Sharing.save(sharing)
        }
    }
};

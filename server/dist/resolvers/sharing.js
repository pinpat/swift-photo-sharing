"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const Album_1 = require("../entity/Album");
const Sharing_1 = require("../entity/Sharing");
const typeorm_1 = require("typeorm");
exports.resolvers = {
    Query: {
        findAllAlbumByAuthor: (_, __, { user }) => __awaiter(this, void 0, void 0, function* () {
            const sharing = yield Sharing_1.Sharing.find({
                relations: ["album", "author"],
                where: { author: { id: user.id } }
            });
            return sharing && sharing.length
                ? sharing.map(item => item.album)
                : [];
        })
    },
    Mutation: {
        addAlbumShare: (_, { shareCode }, { user }) => __awaiter(this, void 0, void 0, function* () {
            const album = yield Album_1.Album.findOne({
                where: { shareCode, author: { id: typeorm_1.Not(user.id) } }
            });
            if (!album) {
                throw new Error("Album not found!");
            }
            let sharing = yield Sharing_1.Sharing.findOne({
                relations: ["album"],
                where: { author: { id: user.id }, album: { id: album.id } }
            });
            if (sharing) {
                throw new Error("Sharing already exist!");
            }
            sharing = new Sharing_1.Sharing();
            sharing.author = user;
            sharing.album = album;
            return Sharing_1.Sharing.save(sharing);
        })
    }
};
//# sourceMappingURL=sharing.js.map
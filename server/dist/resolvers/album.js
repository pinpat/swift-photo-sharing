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
const Attachment_1 = require("../entity/Attachment");
exports.resolvers = {
    Query: {
        findAllAlbum: (_, __, { user }) => __awaiter(this, void 0, void 0, function* () {
            if (!user) {
                throw new Error("Access denied!");
            }
            return yield Album_1.Album.find({
                relations: ["author", "images"],
                where: {
                    author: {
                        id: user.id
                    }
                }
            });
        })
    },
    Mutation: {
        saveAlbum: (_, { name }, { user }) => __awaiter(this, void 0, void 0, function* () {
            let newAlbum = new Album_1.Album();
            newAlbum.name = name;
            newAlbum.author = user;
            newAlbum.shareCode = Math.random().toString(36).substr(2, 8).toUpperCase();
            return yield Album_1.Album.save(newAlbum);
        }),
        deleteAlbum: (_, { id }, { user }) => __awaiter(this, void 0, void 0, function* () {
            const album = yield Album_1.Album.findOne({
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
                ...album.images.reduce((init, image) => image ? [
                    ...init,
                    ...image.image ? [image.image.id] : [],
                    ...image.audioWhen ? [image.audioWhen.id] : [],
                    ...image.audioWhere ? [image.audioWhere.id] : [],
                    ...image.audioWho ? [image.audioWho.id] : []
                ] : [...init], new Array())
            ].filter(_ => _);
            new Attachment_1.Attachment().removeFile(ids);
            return yield album.remove();
        }),
        findAlbumById: (_, { id }, { user }) => __awaiter(this, void 0, void 0, function* () {
            return yield Album_1.Album.findOne({
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
        })
    }
};
//# sourceMappingURL=album.js.map
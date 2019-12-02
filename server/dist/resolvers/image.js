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
const Image_1 = require("../entity/Image");
const Attachment_1 = require("../entity/Attachment");
exports.resolvers = {
    Query: {
        findAllImage: (_, __, { user }) => __awaiter(this, void 0, void 0, function* () {
            if (!user) {
                throw new Error("Access denied!");
            }
            return yield Image_1.Image.find({
                relations: ["image", "author", "album"],
                where: {
                    author: {
                        id: user.id
                    }
                }
            });
        })
    },
    Mutation: {
        findAllImageByAlbumId: (_, { albumId }, { user }) => __awaiter(this, void 0, void 0, function* () {
            return yield Image_1.Image.find({
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
        }),
        saveImage: (_, { imageId, albumId }, { user }) => __awaiter(this, void 0, void 0, function* () {
            const album = yield Album_1.Album.findOne({
                where: { id: albumId, author: { id: user.id } }
            });
            if (!album) {
                throw new Error("Album not found!");
            }
            const image = yield Attachment_1.Attachment.findOne({
                where: { id: imageId, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("File not found!");
            }
            let newImage = new Image_1.Image();
            newImage.image = image;
            newImage.album = album;
            newImage.author = user;
            return yield Image_1.Image.save(newImage);
        }),
        saveAudio: (_, { imageId, audioId, type }, { user }) => __awaiter(this, void 0, void 0, function* () {
            if (!["audioWhen", "audioWhere", "audioWho"].includes(type)) {
                throw new Error("Type not found!");
            }
            const image = yield Image_1.Image.findOne({
                where: { id: imageId, author: { id: user.id } }
            });
            if (!image) {
                throw new Error("Image not found!");
            }
            const audio = yield Attachment_1.Attachment.findOne({
                where: {
                    id: audioId,
                    author: { id: user.id }
                }
            });
            if (!audio) {
                throw new Error("File not found");
            }
            let newAudio = Object.assign({}, image, { [type]: audio });
            return yield Image_1.Image.update({
                id: imageId,
                author: {
                    id: user.id
                }
            }, newAudio);
        }),
        deleteImage: (_, { id }, { user }) => __awaiter(this, void 0, void 0, function* () {
            const image = yield Image_1.Image.findOne({
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
            new Attachment_1.Attachment().removeFile(ids);
            return yield image.remove();
        }),
        findImage: (_, { id }, { user }) => __awaiter(this, void 0, void 0, function* () {
            return yield Image_1.Image.findOne({
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
        })
    }
};
//# sourceMappingURL=image.js.map
"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
const typeorm_1 = require("typeorm");
const Image_1 = require("./Image");
const User_1 = require("./User");
let Album = class Album extends typeorm_1.BaseEntity {
};
__decorate([
    typeorm_1.PrimaryGeneratedColumn(),
    __metadata("design:type", Number)
], Album.prototype, "id", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], Album.prototype, "name", void 0);
__decorate([
    typeorm_1.Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    }),
    __metadata("design:type", Date)
], Album.prototype, "created", void 0);
__decorate([
    typeorm_1.OneToMany(() => Image_1.Image, image => image.album, { nullable: true }),
    __metadata("design:type", Array)
], Album.prototype, "images", void 0);
__decorate([
    typeorm_1.ManyToOne(() => User_1.User, {
        cascade: true,
        onDelete: "CASCADE"
    }),
    typeorm_1.JoinColumn(),
    __metadata("design:type", User_1.User)
], Album.prototype, "author", void 0);
__decorate([
    typeorm_1.Index('share_code_idx', { unique: true }),
    typeorm_1.Column(),
    __metadata("design:type", String)
], Album.prototype, "shareCode", void 0);
Album = __decorate([
    typeorm_1.Entity()
], Album);
exports.Album = Album;
//# sourceMappingURL=Album.js.map
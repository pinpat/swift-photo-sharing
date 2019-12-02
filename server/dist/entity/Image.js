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
const Album_1 = require("./Album");
const User_1 = require("./User");
const Attachment_1 = require("./Attachment");
let Image = class Image extends typeorm_1.BaseEntity {
};
__decorate([
    typeorm_1.PrimaryGeneratedColumn(),
    __metadata("design:type", Number)
], Image.prototype, "id", void 0);
__decorate([
    typeorm_1.OneToOne(() => Attachment_1.Attachment),
    typeorm_1.JoinColumn(),
    __metadata("design:type", Attachment_1.Attachment)
], Image.prototype, "image", void 0);
__decorate([
    typeorm_1.Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    }),
    __metadata("design:type", Date)
], Image.prototype, "created", void 0);
__decorate([
    typeorm_1.ManyToOne(() => Album_1.Album, album => album.images, {
        onDelete: "CASCADE"
    }),
    __metadata("design:type", Album_1.Album)
], Image.prototype, "album", void 0);
__decorate([
    typeorm_1.OneToOne(() => Attachment_1.Attachment, { nullable: true }),
    typeorm_1.JoinColumn(),
    __metadata("design:type", Attachment_1.Attachment)
], Image.prototype, "audioWho", void 0);
__decorate([
    typeorm_1.OneToOne(() => Attachment_1.Attachment, { nullable: true }),
    typeorm_1.JoinColumn(),
    __metadata("design:type", Attachment_1.Attachment)
], Image.prototype, "audioWhen", void 0);
__decorate([
    typeorm_1.OneToOne(() => Attachment_1.Attachment, { nullable: true }),
    typeorm_1.JoinColumn(),
    __metadata("design:type", Attachment_1.Attachment)
], Image.prototype, "audioWhere", void 0);
__decorate([
    typeorm_1.ManyToOne(() => User_1.User, {
        cascade: true,
        onDelete: "CASCADE"
    }),
    typeorm_1.JoinColumn(),
    __metadata("design:type", User_1.User)
], Image.prototype, "author", void 0);
Image = __decorate([
    typeorm_1.Entity()
], Image);
exports.Image = Image;
//# sourceMappingURL=Image.js.map
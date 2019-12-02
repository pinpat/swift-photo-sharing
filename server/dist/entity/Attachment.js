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
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
var Attachment_1;
Object.defineProperty(exports, "__esModule", { value: true });
const typeorm_1 = require("typeorm");
const User_1 = require("./User");
const path_1 = __importDefault(require("path"));
const fs_1 = __importDefault(require("fs"));
let Attachment = Attachment_1 = class Attachment extends typeorm_1.BaseEntity {
    removeFile(args) {
        return __awaiter(this, void 0, void 0, function* () {
            let ids = args && args.length ? args : [this.id];
            const attachments = yield Attachment_1.find({
                where: {
                    id: typeorm_1.In([...ids])
                }
            });
            if (attachments) {
                try {
                    attachments.forEach((attachment) => __awaiter(this, void 0, void 0, function* () {
                        const Path = path_1.default.join(`./storage/${attachment.name}`);
                        yield fs_1.default.unlinkSync(Path);
                    }));
                    yield Attachment_1.delete({
                        id: typeorm_1.In([...ids])
                    });
                }
                catch (error) {
                }
            }
        });
    }
};
__decorate([
    typeorm_1.PrimaryGeneratedColumn(),
    __metadata("design:type", Number)
], Attachment.prototype, "id", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], Attachment.prototype, "name", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], Attachment.prototype, "originalName", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], Attachment.prototype, "contentType", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", Number)
], Attachment.prototype, "size", void 0);
__decorate([
    typeorm_1.Column({
        type: "timestamp",
        nullable: true,
        default: () => "CURRENT_TIMESTAMP"
    }),
    __metadata("design:type", Date)
], Attachment.prototype, "created", void 0);
__decorate([
    typeorm_1.ManyToOne(() => User_1.User, {
        nullable: false,
        cascade: true,
        onDelete: "CASCADE"
    }),
    typeorm_1.JoinColumn(),
    __metadata("design:type", User_1.User)
], Attachment.prototype, "author", void 0);
Attachment = Attachment_1 = __decorate([
    typeorm_1.Entity(),
    typeorm_1.Index(["name"])
], Attachment);
exports.Attachment = Attachment;
//# sourceMappingURL=Attachment.js.map
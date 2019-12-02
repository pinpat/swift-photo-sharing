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
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
var User_1;
Object.defineProperty(exports, "__esModule", { value: true });
const typeorm_1 = require("typeorm");
const class_validator_1 = require("class-validator");
const moment_1 = __importDefault(require("moment"));
const auth_1 = require("../auth");
const bcrypt = __importStar(require("bcryptjs"));
let User = User_1 = class User extends typeorm_1.BaseEntity {
    isAdministrator() {
        return this.roles.includes("administrator");
    }
    login() {
        const expired = moment_1.default().add('14', 'day');
        return {
            id: auth_1.jwtSign(this.id, expired.unix()),
            expired: expired.toDate(),
            user: this,
        };
    }
    static NewUser(input) {
        return __awaiter(this, void 0, void 0, function* () {
            const { firstName, lastName, email, phone, password } = input;
            const obj = new User_1();
            const hashedPassword = yield bcrypt.hash(password, 10);
            obj.lastName = lastName;
            obj.firstName = firstName;
            obj.email = email;
            obj.password = hashedPassword;
            obj.phone = phone;
            obj.roles = ["authenticated"];
            yield obj.save();
            if (obj.id === 1) {
                obj.roles = ['administrator', 'authenticated'];
                yield obj.save();
            }
            return obj;
        });
    }
};
__decorate([
    typeorm_1.PrimaryGeneratedColumn(),
    __metadata("design:type", Number)
], User.prototype, "id", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], User.prototype, "firstName", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], User.prototype, "lastName", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], User.prototype, "phone", void 0);
__decorate([
    typeorm_1.Index('email_idx', { unique: true }),
    typeorm_1.Column(),
    class_validator_1.IsEmail(),
    __metadata("design:type", String)
], User.prototype, "email", void 0);
__decorate([
    typeorm_1.Column(),
    __metadata("design:type", String)
], User.prototype, "password", void 0);
__decorate([
    typeorm_1.Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    }),
    __metadata("design:type", Date)
], User.prototype, "created", void 0);
__decorate([
    typeorm_1.Column({
        type: 'json',
    }),
    __metadata("design:type", Array)
], User.prototype, "roles", void 0);
User = User_1 = __decorate([
    typeorm_1.Entity()
], User);
exports.User = User;
//# sourceMappingURL=User.js.map
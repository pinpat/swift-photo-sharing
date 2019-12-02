"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const bcrypt = __importStar(require("bcryptjs"));
const User_1 = require("../entity/User");
exports.resolvers = {
    Query: {
        me: (_, __, { user }) => {
            if (!user) {
                throw new Error("Access denied!");
            }
            return user;
        }
    },
    Mutation: {
        login: (_, { email, password }) => __awaiter(this, void 0, void 0, function* () {
            const user = yield User_1.User.findOne({ where: { email } });
            if (!user) {
                throw new Error("User not found!");
            }
            const valid = yield bcrypt.compare(password, user.password);
            if (!valid) {
                throw new Error("Password does not match!");
            }
            return user.login();
        }),
        register: (_, { input }) => __awaiter(this, void 0, void 0, function* () {
            return yield User_1.User.NewUser(input);
        })
    }
};
//# sourceMappingURL=user.js.map
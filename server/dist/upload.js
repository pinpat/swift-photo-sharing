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
const auth_1 = require("./auth");
const User_1 = require("./entity/User");
exports.authUploadRequest = (req, res, next) => __awaiter(this, void 0, void 0, function* () {
    const token = auth_1.getTokenFromRequest(req);
    if (!token) {
        return res.send(401, 'Access denied!');
    }
    const userId = yield auth_1.getUserIdFromToken(token);
    if (!userId) {
        return res.send(401, 'Access denied!');
    }
    const user = yield User_1.User.findOne(userId);
    if (!user) {
        return res.send(401, 'Access denied!');
    }
    req.currentUser = user;
    next();
});
//# sourceMappingURL=upload.js.map
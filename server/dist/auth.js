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
const jwt = __importStar(require("jsonwebtoken"));
const key = "WiX0torZDWZXrus8LCE9urAjZomQEasQ";
exports.jwtSign = (userId, expiredIn) => {
    return jwt.sign({ userId }, key, {
        expiresIn: expiredIn,
    });
};
exports.getUserIdFromRequest = (req) => __awaiter(this, void 0, void 0, function* () {
    const token = exports.getTokenFromRequest(req);
    return exports.getUserIdFromToken(token);
});
exports.getTokenFromRequest = (req) => {
    let token = req.headers.authorization || '';
    if (token != "") {
        token = token.split(" ")[1];
    }
    return token;
};
exports.getUserIdFromToken = (token) => {
    return new Promise((resolve) => {
        jwt.verify(token, key, function (err, payload) {
            if (err) {
                resolve(0);
            }
            return resolve(payload.userId);
        });
    });
};
//# sourceMappingURL=auth.js.map
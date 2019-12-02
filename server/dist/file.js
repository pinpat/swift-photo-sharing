"use strict";
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
Object.defineProperty(exports, "__esModule", { value: true });
const path_1 = __importDefault(require("path"));
const fs_1 = __importDefault(require("fs"));
const Attachment_1 = require("./entity/Attachment");
const jwt = __importStar(require("jsonwebtoken"));
const moment_1 = __importDefault(require("moment"));
const auth_1 = require("./auth");
const User_1 = require("./entity/User");
const config_1 = require("./config");
const key = 'jwt-file-service-key';
exports.fileUploadSuccessHandler = (req, response) => __awaiter(this, void 0, void 0, function* () {
    const file = req.file;
    if (!file) {
        response.status(404);
        response.send('No file upload found!');
    }
    const userId = yield auth_1.getUserIdFromRequest(req);
    const user = yield User_1.User.findOne(userId);
    if (!user) {
        response.status(401);
        response.send('Access denied!');
        return;
    }
    const attachment = new Attachment_1.Attachment();
    attachment.name = file.filename;
    attachment.originalName = file.originalname;
    attachment.contentType = file.mimetype;
    attachment.size = file.size;
    attachment.author = user;
    attachment.created = new Date();
    yield attachment.save();
    attachment.url = yield exports.generateFileUrl(attachment.name, moment_1.default().add('1', 'day').unix());
    response.json(attachment);
});
exports.fileHandler = (req, response) => __awaiter(this, void 0, void 0, function* () {
    const name = req.params.name;
    const key = req.query.key;
    const filename = yield exports.validateFileToken(key);
    if (!key || !filename) {
        response.status(401);
        response.send("Access denied!");
        return;
    }
    const attachment = yield Attachment_1.Attachment.findOne({ where: { name } });
    if (!attachment) {
        response.status(404);
        response.send('File not found!');
        return;
    }
    const filePath = path_1.default.join(`./storage/${name}`);
    const stat = fs_1.default.statSync(filePath);
    response.writeHead(200, {
        'Content-Type': attachment.contentType,
        'Content-Length': stat.size
    });
    const readStream = fs_1.default.createReadStream(filePath);
    readStream.pipe(response);
});
exports.generateFileUrl = (fileName, expiredIn) => {
    const token = jwt.sign({ file: fileName }, key, {
        expiresIn: expiredIn,
    });
    return `${config_1.URL}/file/${fileName}?key=${token}`;
};
exports.validateFileToken = (token) => __awaiter(this, void 0, void 0, function* () {
    return yield new Promise((resolve) => {
        jwt.verify(token, key, function (err, payload) {
            if (err) {
                resolve("");
            }
            return resolve(payload.file);
        });
    });
});
exports.fileRemove = (req, response) => __awaiter(this, void 0, void 0, function* () {
    const attachment = yield Attachment_1.Attachment.findOneOrFail(req.params.id);
    if (attachment) {
        const Path = path_1.default.join(`./storage/${attachment.name}`);
        yield fs_1.default.unlinkSync(Path);
        yield attachment.remove();
        response.end("Delete Complete!");
    }
    else {
        response.status(404);
        response.send("File not found!");
        return;
    }
});
//# sourceMappingURL=file.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const user_1 = require("./user");
const album_1 = require("./album");
const image_1 = require("./image");
const sharing_1 = require("./sharing");
const lodash_1 = require("lodash");
exports.resolvers = lodash_1.merge(user_1.resolvers, album_1.resolvers, image_1.resolvers, sharing_1.resolvers);
//# sourceMappingURL=index.js.map
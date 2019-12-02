"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PORT = process.env.PORT ? process.env.PORT : 4000;
exports.DOMAIN = process.env.DOMAIN ? process.env.DOMAIN : 'localhost:4000';
exports.URL = process.env.DOMAIN ? `https://${process.env.DOMAIN}` : 'http://localhost:4000';
//# sourceMappingURL=config.js.map
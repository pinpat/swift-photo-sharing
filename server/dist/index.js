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
Object.defineProperty(exports, "__esModule", { value: true });
require("reflect-metadata");
require("dotenv/config");
const typeorm_1 = require("typeorm");
const apollo_server_express_1 = require("apollo-server-express");
const express_1 = __importDefault(require("express"));
const multer_1 = __importDefault(require("multer"));
const cors_1 = __importDefault(require("cors"));
const schema_1 = require("./schema");
const config_1 = require("./config");
const auth_1 = require("./auth");
const User_1 = require("./entity/User");
const http_1 = __importDefault(require("http"));
const directives_1 = require("./directives");
const resolvers_1 = require("./resolvers");
const uuid_1 = require("uuid");
const upload_1 = require("./upload");
const file_1 = require("./file");
const startServer = () => __awaiter(this, void 0, void 0, function* () {
    const server = new apollo_server_express_1.ApolloServer({
        typeDefs: schema_1.schema,
        resolvers: resolvers_1.resolvers,
        playground: process.env.DISABLE_PLAYGROUND !== 'true',
        introspection: process.env.DISABLE_PLAYGROUND !== 'true',
        context: (ctx) => __awaiter(this, void 0, void 0, function* () {
            if (ctx.connection) {
                return ctx.connection.context;
            }
            else {
                const req = ctx.req;
                const token = auth_1.getTokenFromRequest(req);
                let user = null;
                if (token != "") {
                    const userId = yield auth_1.getUserIdFromToken(token);
                    user = yield User_1.User.findOne(userId);
                }
                return { user };
            }
        }),
        schemaDirectives: {
            hasRole: directives_1.RoleDirective
        }
    });
    yield typeorm_1.createConnection();
    const app = express_1.default();
    const corsOptions = {
        credentials: true,
        origin: '*',
    };
    server.applyMiddleware({
        app,
        cors: corsOptions,
        bodyParserConfig: { limit: "10mb" },
    });
    app.use(cors_1.default(corsOptions));
    const storage = multer_1.default.diskStorage({
        destination: function (_req, _file, cb) {
            cb(null, './storage');
        },
        filename: function (_req, file, cb) {
            cb(null, `${uuid_1.v4()}-${file.originalname}`);
        }
    });
    const upload = multer_1.default({ storage: storage });
    app.post('/upload', upload_1.authUploadRequest, upload.single('file'), file_1.fileUploadSuccessHandler);
    app.get('/file/:name', file_1.fileHandler);
    const httpServer = http_1.default.createServer(app);
    server.installSubscriptionHandlers(httpServer);
    httpServer.listen({ port: config_1.PORT }, () => console.log(`🚀 Server ready at http://localhost:${config_1.PORT}${server.graphqlPath}`));
});
startServer().catch((e) => {
    throw e;
});
//# sourceMappingURL=index.js.map
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
const apollo_server_express_1 = require("apollo-server-express");
const graphql_1 = require("graphql");
class RoleDirective extends apollo_server_express_1.SchemaDirectiveVisitor {
    visitFieldDefinition(field) {
        const { resolve = graphql_1.defaultFieldResolver } = field;
        const { roles } = this.args;
        field.resolve = function (...args) {
            return __awaiter(this, void 0, void 0, function* () {
                const [, , { user }] = args;
                if (roles.length && !user) {
                    throw new Error("Access denied!");
                }
                let roleMapping = new Map();
                let hasRole = false;
                user.roles.forEach((role) => {
                    roleMapping.set(role, role);
                });
                roles.forEach((role) => {
                    if (roleMapping.get(role)) {
                        hasRole = true;
                    }
                });
                if (!hasRole) {
                    throw new Error("Access denied!");
                }
                return yield resolve.apply(this, args);
            });
        };
    }
}
exports.RoleDirective = RoleDirective;
//# sourceMappingURL=directives.js.map
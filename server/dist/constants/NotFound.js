"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class NotFound {
    set(name) {
        this.name = name;
        return this;
    }
    get getName() {
        return this.name;
    }
    message() {
        return `${this.name} not found!`;
    }
    error() {
        throw Error(this.message());
    }
}
exports.default = NotFound;
//# sourceMappingURL=NotFound.js.map
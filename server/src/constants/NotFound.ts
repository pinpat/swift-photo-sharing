export default class NotFound{
    private name: string;

    set(name: string){
        this.name = name
        return this
    }

    get getName(): string {
        return this.name;
    }

    message(): string {
        return `${this.name} not found!`;
    }

    error() {
        throw Error(this.message());
    }
}

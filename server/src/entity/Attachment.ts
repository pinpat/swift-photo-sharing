import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    BaseEntity,
    Index,
    ManyToOne,
    JoinColumn,
    In
} from "typeorm";
import { User } from "./User";
import path from "path";
import fileSystem from "fs";

@Entity()
@Index(["name"])
export class Attachment extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    originalName: string;

    @Column()
    contentType: string;

    @Column()
    size: number;

    @Column({
        type: "timestamp",
        nullable: true,
        default: () => "CURRENT_TIMESTAMP"
    })
    created: Date;

    //Do not add @Column
    url: string;

    @ManyToOne(() => User, {
        nullable: false,
        cascade: true,
        onDelete: "CASCADE"
    })
    @JoinColumn()
    author: User;

    public async removeFile(args?: Array<number>) {
        let ids = args && args.length ? args : [this.id];

        const attachments = await Attachment.find({
            where: {
                id: In([...ids])
            }
        });
        if (attachments) {
            try {
                attachments.forEach(async attachment => {
                    const Path = path.join(`./storage/${attachment.name}`);
                    await fileSystem.unlinkSync(Path);
                });
                await Attachment.delete({
                    id: In([...ids])
                });
            } catch (error) {
                
            }
        }
    }
}

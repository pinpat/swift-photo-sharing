import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    OneToMany,
    ManyToOne,
    JoinColumn,
    OneToOne,
    BaseEntity
} from "typeorm";
import { Image } from "./Image";
import { User } from "./User";
import { Attachment } from "./Attachment";

@Entity()
export class Album extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToOne(() => Attachment)
    @JoinColumn()
    gallery: Attachment;

    @Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    })
    created: Date;

    @OneToMany(
        () => Image,
        image => image.album
    )
    images: Image[];

    @ManyToOne(() => User, {
        cascade: true,
        onDelete: "CASCADE"
    })
    @JoinColumn()
    author: User;
}

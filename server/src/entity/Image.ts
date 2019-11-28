import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    ManyToOne,
    JoinColumn,
    OneToOne,
    BaseEntity
} from "typeorm";
import { Album } from "./Album";
import { User } from "./User";
import { Attachment } from "./Attachment";

@Entity()
export class Image extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @OneToOne(() => Attachment)
    @JoinColumn()
    image: Attachment;

    @Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    })
    created: Date;

    @ManyToOne(
        () => Album,
        album => album.images,
        {
            onDelete: "CASCADE"
        }
    )
    album: Album;

    @OneToOne(() => Attachment, {nullable: true} )
    @JoinColumn()
    audioWho: Attachment;

    @OneToOne(() => Attachment,{nullable: true})
    @JoinColumn()
    audioWhen: Attachment;

    @OneToOne(() => Attachment,{nullable: true})
    @JoinColumn()
    audioWhere: Attachment;

    @ManyToOne(() => User, {
        cascade: true,
        onDelete: "CASCADE"
    })
    @JoinColumn()
    author: User;
}

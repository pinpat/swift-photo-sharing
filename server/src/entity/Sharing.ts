import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    ManyToOne,
    JoinColumn,
    BaseEntity
} from "typeorm";
import { User } from "./User";
import { Album } from "./Album";

@Entity()
export class Sharing extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(
        () => Album,
        album => album.shareCode,
        {
            cascade: true,
            onDelete: "CASCADE"
        }
    )
    @JoinColumn()
    album: Album;

    @Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    })
    created: Date;

    @ManyToOne(
        () => User,
        user => user.id,
        {
            cascade: true,
            onDelete: "CASCADE"
        }
    )
    @JoinColumn()
    author: User;
}

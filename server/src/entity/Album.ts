import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    OneToMany,
    ManyToOne,
    JoinColumn,
    BaseEntity,
    Index
} from "typeorm";
import { Image } from "./Image";
import { User } from "./User";

@Entity()
export class Album extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    })
    created: Date;

    @OneToMany(
        () => Image,
        image => image.album,
        {nullable: true}
    )
    images: Image[];

    @ManyToOne(() => User, {
        cascade: true,
        onDelete: "CASCADE"
    })
    @JoinColumn()
    author: User;

    @Index('share_code_idx', {unique: true})
    @Column()
    shareCode: String;
}

import {Entity, PrimaryGeneratedColumn, Column, BaseEntity, Index} from "typeorm";
import {IsEmail} from "class-validator";
import moment from 'moment';
import {Token} from "../interfaces/Token";
import {jwtSign} from "../auth";
import * as bcrypt from "bcryptjs";

@Entity()
export class User extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({nullable: true})
    firstName: string;

    @Column({nullable: true})
    lastName: string;

    @Column({nullable: true})
    phone: string;

    @Index('email_idx', {unique: true})
    @Column()
    @IsEmail()
    email: string;

    @Column()
    password: string;

    @Column({
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP"
    })
    created: Date;

    @Column({
        type: 'json',
    })
    roles: string[];


    /**
     * Check if user is administrator
     */
    public isAdministrator(): boolean {
        return this.roles.includes("administrator");
    }


    login(): Token {
        const expired = moment().add('14', 'day');
        return {
            id: jwtSign(this.id, expired.unix()),
            expired: expired.toDate(),
            user: this,
        }
    }

    public static async NewUser(input: any) {
        const {email, password} = input;
        const obj = new User();
        const hashedPassword = await bcrypt.hash(password, 10);
        obj.email = email;
        obj.password = hashedPassword;
        obj.roles = ["authenticated"];
        await obj.save();
        if (obj.id === 1) {
            obj.roles = ['administrator', 'authenticated'];
            await obj.save()
        }
        return obj;

    }


}

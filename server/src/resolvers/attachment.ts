import { IResolvers } from "graphql-tools";
import {generateFileUrl} from "../file";
import moment from "moment";
import { Attachment } from "../entity/Attachment";

export const resolvers: IResolvers = {
    Query: {
        
    },
    Mutation: {
        generateURL: async(_,{name},{user}) => {
            if (!user) {
                throw new Error("Access denied!");
            }
            let file = await Attachment.findOne({
                where: {
                    name,
                    author: {
                        id: user.id
                    }
                }
            })
            if(!file){
                throw new Error("File not found!")
            }

            file.url = await generateFileUrl(name, moment().add('1', 'day').unix())
            return file
        }
    }
}
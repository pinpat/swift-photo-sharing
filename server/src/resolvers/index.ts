import { resolvers as userResolvers } from "./user";
import { resolvers as albumResolvers } from "./album";
import { resolvers as imageResolvers } from "./image";
import { resolvers as sharingResolvers } from "./sharing";
import { resolvers as attachmentResolvers } from "./attachment";
import { merge } from "lodash";

export const resolvers = merge(userResolvers, albumResolvers, imageResolvers, sharingResolvers, attachmentResolvers);

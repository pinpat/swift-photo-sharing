import { resolvers as userResolvers } from "./user";
import { resolvers as albumResolvers } from "./album";
import { resolvers as imageResolvers } from "./image";
import { merge } from "lodash";

export const resolvers = merge(userResolvers, albumResolvers, imageResolvers);

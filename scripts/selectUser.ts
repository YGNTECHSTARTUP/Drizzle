import { and, between, eq, gt, gte, inArray, not, notBetween } from "drizzle-orm";
import { db } from "../db/db";
import { profiles, users } from "../db/schema";
const user = await db.select().from(users)
console.log(user)
// const profiless = await db.select().from(profiles)
// console.log(profiless)
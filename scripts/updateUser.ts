import { eq } from "drizzle-orm";
import { db } from "../db/db";
import { profiles, users } from "../db/schema";
// await db.update(users).set({age:18}).where(eq(users.age,4))
await db.update(profiles).set({userId:1}).where(eq(profiles.name,"User 0"))
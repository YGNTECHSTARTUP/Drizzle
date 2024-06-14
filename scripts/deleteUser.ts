import { eq, gt } from "drizzle-orm";
import { db } from "../db/db";
import { account, bank, profiles, users } from "../db/schema";
await db.delete(profiles)
await db.delete(users)
await db.delete(account)
await db.delete(bank)

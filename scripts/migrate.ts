import { db } from "../db/db";
import "dotenv/config";
import { migrate } from "drizzle-orm/neon-http/migrator";
await migrate(db,{migrationsFolder:'../db/migrations'})
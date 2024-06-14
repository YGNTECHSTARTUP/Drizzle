CREATE TABLE IF NOT EXISTS "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"age" integer NOT NULL
);
--> statement-breakpoint
DROP TABLE "users_table";
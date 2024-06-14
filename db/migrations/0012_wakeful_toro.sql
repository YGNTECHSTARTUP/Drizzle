CREATE TABLE IF NOT EXISTS "account" (
	"id" serial PRIMARY KEY NOT NULL,
	"accountNumber" text NOT NULL,
	"balence" integer NOT NULL,
	"bankid" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bank" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"branch" varchar(255) NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "account" ADD CONSTRAINT "account_bankid_bank_id_fk" FOREIGN KEY ("bankid") REFERENCES "public"."bank"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

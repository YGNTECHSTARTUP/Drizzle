CREATE TABLE IF NOT EXISTS "account" (
	"id" serial PRIMARY KEY NOT NULL,
	"accountNumber" text NOT NULL,
	"balence" integer NOT NULL,
	"bankcode" integer NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "account" ADD CONSTRAINT "account_bankcode_bank_id_fk" FOREIGN KEY ("bankcode") REFERENCES "public"."bank"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

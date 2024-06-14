ALTER TABLE "account" DROP CONSTRAINT "account_bankcode_bank_branchcode_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "account" ADD CONSTRAINT "account_bankcode_bank_id_fk" FOREIGN KEY ("bankcode") REFERENCES "public"."bank"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "bank" DROP COLUMN IF EXISTS "branchcode";
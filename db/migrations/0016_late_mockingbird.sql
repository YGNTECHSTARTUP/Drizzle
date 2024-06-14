ALTER TABLE "account" RENAME COLUMN "icici" TO "bankcode";--> statement-breakpoint
ALTER TABLE "account" DROP CONSTRAINT "account_icici_unique";--> statement-breakpoint
ALTER TABLE "bank" DROP CONSTRAINT "bank_branchcode_account_icici_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "account" ADD CONSTRAINT "account_bankcode_bank_branchcode_fk" FOREIGN KEY ("bankcode") REFERENCES "public"."bank"("branchcode") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

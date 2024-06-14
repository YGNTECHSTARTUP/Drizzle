ALTER TABLE "account" DROP CONSTRAINT "account_bankid_bank_id_fk";
--> statement-breakpoint
ALTER TABLE "account" ALTER COLUMN "accountNumber" SET DATA TYPE bigint;--> statement-breakpoint
ALTER TABLE "account" ALTER COLUMN "accountNumber" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "account" ADD COLUMN "icici" varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE "bank" ADD COLUMN "bankid" integer NOT NULL;--> statement-breakpoint
ALTER TABLE "bank" ADD COLUMN "branchcode" varchar(255) NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bank" ADD CONSTRAINT "bank_bankid_users_id_fk" FOREIGN KEY ("bankid") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bank" ADD CONSTRAINT "bank_branchcode_account_icici_fk" FOREIGN KEY ("branchcode") REFERENCES "public"."account"("icici") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "account" DROP COLUMN IF EXISTS "bankid";
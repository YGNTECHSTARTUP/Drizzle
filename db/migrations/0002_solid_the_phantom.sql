ALTER TABLE "users_table" ADD COLUMN "email" text;--> statement-breakpoint
ALTER TABLE "users_table" ADD CONSTRAINT "users_table_email_unique" UNIQUE("email");
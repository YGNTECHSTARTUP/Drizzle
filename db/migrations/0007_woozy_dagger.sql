ALTER TABLE "users" ADD COLUMN "startAt" time DEFAULT now();--> statement-breakpoint
ALTER TABLE "users" DROP COLUMN IF EXISTS "date";--> statement-breakpoint
ALTER TABLE "users" DROP COLUMN IF EXISTS "data";
DO $$ BEGIN
 CREATE TYPE "public"."mood" AS ENUM('happy', 'sad', 'angry', 'neutral', 'confused');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "mood" "mood" DEFAULT 'neutral';
CREATE TABLE IF NOT EXISTS "profiles" (
	"name" varchar(255) NOT NULL,
	"bio" varchar(1024) NOT NULL,
	"userId" integer NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "profiles" ADD CONSTRAINT "profiles_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

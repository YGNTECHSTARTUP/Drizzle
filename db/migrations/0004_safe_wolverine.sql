ALTER TABLE "users" ADD COLUMN "isMale" boolean DEFAULT true NOT NULL;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "description" varchar(1600);--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "mood" "mood" DEFAULT 'angry';--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "date" interval;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "data" jsonb NOT NULL;
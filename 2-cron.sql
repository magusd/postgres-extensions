CREATE EXTENSION IF NOT EXISTS pg_cron;
-- Vacuum every day at 10:00am (GMT)
SELECT cron.schedule('nightly-vacuum', '0 10 * * *', 'VACUUM');
-- Change to vacuum at 3:00am (GMT)
SELECT cron.schedule('nightly-vacuum', '0 3 * * *', 'VACUUM');
-- Stop scheduling jobs
SELECT cron.unschedule('nightly-vacuum' );

DROP TABLE IF EXISTS "cronjob_test";
CREATE TABLE IF NOT EXISTS "cronjob_test" (
    "id" serial NOT NULL PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "created_at" timestamp with time zone NOT NULL DEFAULT now(),
    "updated_at" timestamp with time zone NOT NULL DEFAULT now()
);


INSERT INTO "cronjob_test" ("name") VALUES ('test');

SELECT * FROM "cronjob_test";

SELECT cron.schedule('test', '* * * * *', 'INSERT INTO "cronjob_test" ("name") VALUES (''test'');');

SELECT pg_sleep(60);
SELECT * FROM "cronjob_test";

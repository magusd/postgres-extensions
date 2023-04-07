DROP TABLE IF EXISTS app_caching;

CREATE UNLOGGED TABLE "app_caching"  
(
  k character varying NOT NULL,
  v character varying NOT NULL,
  CONSTRAINT "key_pkey" PRIMARY KEY (k)
);

insert into app_caching (k, v) values ('k1', 'value1') ON CONFLICT (k) DO UPDATE set v = 'value1';
insert into app_caching (k, v) values ('k1', 'value1') ON CONFLICT (k) DO UPDATE set v = 'value1';
insert into app_caching (k, v) values ('k1', 'value1') ON CONFLICT (k) DO UPDATE set v = 'value1';
insert into app_caching (k, v) values ('k1', 'value1') ON CONFLICT (k) DO UPDATE set v = 'value1';

ALTER TABLE "app_caching" SET UNLOGGED ;

ALTER TABLE "app_caching" SET LOGGED  ;

SELECT relname FROM pg_class WHERE relpersistence = 'u';

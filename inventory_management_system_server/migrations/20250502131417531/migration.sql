BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "categories" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "parentCategoryId" bigint,
    "productCount" bigint,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "category_name_idx" ON "categories" USING btree ("name");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "customers" ADD COLUMN "contactPerson" text;
ALTER TABLE "customers" ADD COLUMN "gstin" text;
ALTER TABLE "customers" ADD COLUMN "orderCount" bigint;
ALTER TABLE "customers" ADD COLUMN "lifetimeValue" double precision;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "suppliers" (
    "id" bigserial PRIMARY KEY,
    "supplierCode" text NOT NULL,
    "name" text NOT NULL,
    "contactPerson" text,
    "email" text,
    "phone" text,
    "address" text,
    "gstin" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "supplier_code_idx" ON "suppliers" USING btree ("supplierCode");
CREATE INDEX "supplier_name_idx" ON "suppliers" USING btree ("name");
CREATE INDEX "supplier_email_idx" ON "suppliers" USING btree ("email");
CREATE INDEX "supplier_phone_idx" ON "suppliers" USING btree ("phone");


--
-- MIGRATION VERSION FOR inventory_management_system
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('inventory_management_system', '20250502131417531', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250502131417531', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

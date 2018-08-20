CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_16B7D01B_95BB_4A52_A5A9_9C018DA425C4 START WITH 0 BELONGS_TO_TABLE;

CREATE CACHED TABLE PUBLIC."blueprints"(
  "id" BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_16B7D01B_95BB_4A52_A5A9_9C018DA425C4) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_16B7D01B_95BB_4A52_A5A9_9C018DA425C4,
  "guid" VARCHAR(32) DEFAULT LEFT(CONVERT(SECURE_RAND(64),VARCHAR(32)), 12) NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "description" VARCHAR(255),
  "sha256" VARCHAR(64),
  "revision" BIGINT NOT NULL,
  "template" BINARY NOT NULL,
  "timestamp" BIGINT NOT NULL,
);

CREATE INDEX PUBLIC."blueprints_guid_idx"
  ON PUBLIC."blueprints"("guid");

ALTER TABLE IF EXISTS PUBLIC."blueprints"
  ADD CONSTRAINT PUBLIC."blueprints_pk" PRIMARY KEY("id");

ALTER TABLE IF EXISTS "deployments"
  ADD "blueprint_id" BIGINT;

ALTER TABLE PUBLIC."deployments"
  ADD CONSTRAINT PUBLIC."deployments_have_blueprints"
  FOREIGN KEY("blueprint_id")
  REFERENCES PUBLIC."blueprints"("id") NOCHECK;

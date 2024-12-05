/*
  Warnings:

  - Made the column `fullname` on table `profile` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "profile" ALTER COLUMN "fullname" SET NOT NULL,
ALTER COLUMN "desc" DROP NOT NULL,
ALTER COLUMN "desc" SET DEFAULT '',
ALTER COLUMN "img" DROP NOT NULL,
ALTER COLUMN "img" SET DEFAULT '',
ALTER COLUMN "slogan" DROP NOT NULL,
ALTER COLUMN "slogan" SET DEFAULT '',
ALTER COLUMN "nameStore" SET DEFAULT '';

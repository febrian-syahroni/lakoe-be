/*
  Warnings:

  - You are about to drop the column `name` on the `profile` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "profile" DROP COLUMN "name",
ADD COLUMN     "nameStore" TEXT;

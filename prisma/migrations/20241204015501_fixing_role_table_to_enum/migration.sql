/*
  Warnings:

  - You are about to drop the `role` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "role_enum" AS ENUM ('ADMIN', 'SELLER');

-- DropForeignKey
ALTER TABLE "role" DROP CONSTRAINT "role_userId_fkey";

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "role" "role_enum" NOT NULL DEFAULT 'SELLER';

-- DropTable
DROP TABLE "role";

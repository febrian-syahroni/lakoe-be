/*
  Warnings:

  - You are about to drop the column `userId` on the `Location` table. All the data in the column will be lost.
  - Added the required column `tokoId` to the `Location` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fullname` to the `profile` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_userId_fkey";

-- DropIndex
DROP INDEX "Location_userId_key";

-- AlterTable
ALTER TABLE "Location" DROP COLUMN "userId",
ADD COLUMN     "tokoId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "product" ALTER COLUMN "is_active" SET DEFAULT false;

-- AlterTable
ALTER TABLE "profile" ADD COLUMN     "fullname" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "role" ALTER COLUMN "is_active" SET DEFAULT true;

-- CreateTable
CREATE TABLE "toko" (
    "id" SERIAL NOT NULL,
    "nama_toko" TEXT NOT NULL,
    "slogan_toko" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "img" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "toko_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "toko_userId_key" ON "toko"("userId");

-- AddForeignKey
ALTER TABLE "toko" ADD CONSTRAINT "toko_userId_fkey" FOREIGN KEY ("userId") REFERENCES "profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_tokoId_fkey" FOREIGN KEY ("tokoId") REFERENCES "toko"("id") ON DELETE CASCADE ON UPDATE CASCADE;

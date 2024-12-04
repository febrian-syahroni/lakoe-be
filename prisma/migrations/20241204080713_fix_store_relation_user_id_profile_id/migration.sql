/*
  Warnings:

  - You are about to drop the `toko` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_storeId_fkey";

-- DropForeignKey
ALTER TABLE "toko" DROP CONSTRAINT "toko_userId_fkey";

-- DropTable
DROP TABLE "toko";

-- CreateTable
CREATE TABLE "store" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slogan" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "img" TEXT NOT NULL,
    "profileId" INTEGER NOT NULL,

    CONSTRAINT "store_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "store_profileId_key" ON "store"("profileId");

-- AddForeignKey
ALTER TABLE "store" ADD CONSTRAINT "store_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "store"("id") ON DELETE CASCADE ON UPDATE CASCADE;

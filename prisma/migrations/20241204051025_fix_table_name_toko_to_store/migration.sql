/*
  Warnings:

  - You are about to drop the column `tokoId` on the `Location` table. All the data in the column will be lost.
  - You are about to drop the column `nama_toko` on the `toko` table. All the data in the column will be lost.
  - You are about to drop the column `slogan_toko` on the `toko` table. All the data in the column will be lost.
  - Added the required column `storeId` to the `Location` table without a default value. This is not possible if the table is not empty.
  - Added the required column `slogan` to the `toko` table without a default value. This is not possible if the table is not empty.
  - Added the required column `store_name` to the `toko` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_tokoId_fkey";

-- AlterTable
ALTER TABLE "Location" DROP COLUMN "tokoId",
ADD COLUMN     "storeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "profile" ALTER COLUMN "fullname" DROP NOT NULL;

-- AlterTable
ALTER TABLE "toko" DROP COLUMN "nama_toko",
DROP COLUMN "slogan_toko",
ADD COLUMN     "slogan" TEXT NOT NULL,
ADD COLUMN     "store_name" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "toko"("id") ON DELETE CASCADE ON UPDATE CASCADE;

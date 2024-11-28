/*
  Warnings:

  - You are about to drop the column `name` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `Cabang` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `toko` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Cabang" DROP CONSTRAINT "Cabang_tokoId_fkey";

-- AlterTable
ALTER TABLE "toko" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "user" DROP COLUMN "name",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "username" TEXT NOT NULL;

-- DropTable
DROP TABLE "Cabang";

-- CreateTable
CREATE TABLE "cabang" (
    "id" SERIAL NOT NULL,
    "nama_toko_cabang" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "kota" TEXT NOT NULL,
    "kode_pos" TEXT NOT NULL,
    "pin_point" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "tokoId" INTEGER NOT NULL,

    CONSTRAINT "cabang_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "cabang" ADD CONSTRAINT "cabang_tokoId_fkey" FOREIGN KEY ("tokoId") REFERENCES "toko"("id") ON DELETE CASCADE ON UPDATE CASCADE;

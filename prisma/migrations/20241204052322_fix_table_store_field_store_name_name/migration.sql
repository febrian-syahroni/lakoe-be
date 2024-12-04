/*
  Warnings:

  - You are about to drop the column `store_name` on the `toko` table. All the data in the column will be lost.
  - Added the required column `name` to the `toko` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "toko" DROP COLUMN "store_name",
ADD COLUMN     "name" TEXT NOT NULL;

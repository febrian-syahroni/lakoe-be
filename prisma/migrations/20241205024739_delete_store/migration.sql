/*
  Warnings:

  - You are about to drop the column `storeId` on the `Location` table. All the data in the column will be lost.
  - You are about to drop the `store` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `profileId` to the `Location` table without a default value. This is not possible if the table is not empty.
  - Added the required column `desc` to the `profile` table without a default value. This is not possible if the table is not empty.
  - Added the required column `img` to the `profile` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `profile` table without a default value. This is not possible if the table is not empty.
  - Added the required column `slogan` to the `profile` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_storeId_fkey";

-- DropForeignKey
ALTER TABLE "store" DROP CONSTRAINT "store_profileId_fkey";

-- AlterTable
ALTER TABLE "Location" DROP COLUMN "storeId",
ADD COLUMN     "profileId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "profile" ADD COLUMN     "desc" TEXT NOT NULL,
ADD COLUMN     "img" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "slogan" TEXT NOT NULL;

-- DropTable
DROP TABLE "store";

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

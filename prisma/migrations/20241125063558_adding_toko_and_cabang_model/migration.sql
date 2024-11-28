-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "toko" (
    "id" SERIAL NOT NULL,
    "nama_toko" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "slogan" TEXT NOT NULL,
    "desc" TEXT NOT NULL,
    "img" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "toko_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cabang" (
    "id" SERIAL NOT NULL,
    "nama_toko_cabang" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "kota" TEXT NOT NULL,
    "kode_pos" TEXT NOT NULL,
    "pin_point" TEXT NOT NULL,
    "tokoId" INTEGER NOT NULL,

    CONSTRAINT "Cabang_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "toko_userId_key" ON "toko"("userId");

-- AddForeignKey
ALTER TABLE "toko" ADD CONSTRAINT "toko_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cabang" ADD CONSTRAINT "Cabang_tokoId_fkey" FOREIGN KEY ("tokoId") REFERENCES "toko"("id") ON DELETE CASCADE ON UPDATE CASCADE;

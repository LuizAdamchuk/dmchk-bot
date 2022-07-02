-- CreateTable
CREATE TABLE "User" (
    "user_id" TEXT NOT NULL,
    "user_messenger_id" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "user_phone_number" INTEGER NOT NULL,
    "user_gender" TEXT NOT NULL,
    "user_accept_notitication" BOOLEAN NOT NULL,
    "user_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "Location" (
    "location_id" TEXT NOT NULL,
    "location_country" TEXT NOT NULL,
    "location_state" TEXT NOT NULL,
    "location_city" TEXT NOT NULL,
    "location_detail" TEXT NOT NULL,
    "location_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location_updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location_user_id" TEXT,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("location_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_user_messenger_id_key" ON "User"("user_messenger_id");

-- CreateIndex
CREATE UNIQUE INDEX "Location_location_country_key" ON "Location"("location_country");

-- CreateIndex
CREATE UNIQUE INDEX "Location_location_state_key" ON "Location"("location_state");

-- CreateIndex
CREATE UNIQUE INDEX "Location_location_city_key" ON "Location"("location_city");

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_location_user_id_fkey" FOREIGN KEY ("location_user_id") REFERENCES "User"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- CreateTable
CREATE TABLE "user" (
    "user_id" TEXT NOT NULL,
    "user_messenger_id" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "user_phone_number" INTEGER NOT NULL,
    "user_gender" TEXT NOT NULL,
    "user_accept_notitication" BOOLEAN NOT NULL,
    "user_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "location" (
    "location_id" TEXT NOT NULL,
    "location_country" TEXT NOT NULL,
    "location_state" TEXT NOT NULL,
    "location_city" TEXT NOT NULL,
    "location_detail" TEXT NOT NULL,
    "location_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location_updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location_user_id" TEXT,

    CONSTRAINT "location_pkey" PRIMARY KEY ("location_id")
);

-- CreateTable
CREATE TABLE "nlp_implementation" (
    "nlp_id" TEXT NOT NULL,
    "nlp_doubt" TEXT NOT NULL,
    "nlp_valid" BOOLEAN NOT NULL,
    "nlp_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nlp_updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "nlp_implementation_pkey" PRIMARY KEY ("nlp_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_user_messenger_id_key" ON "user"("user_messenger_id");

-- CreateIndex
CREATE UNIQUE INDEX "location_location_country_key" ON "location"("location_country");

-- CreateIndex
CREATE UNIQUE INDEX "location_location_state_key" ON "location"("location_state");

-- CreateIndex
CREATE UNIQUE INDEX "location_location_city_key" ON "location"("location_city");

-- AddForeignKey
ALTER TABLE "location" ADD CONSTRAINT "location_location_user_id_fkey" FOREIGN KEY ("location_user_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

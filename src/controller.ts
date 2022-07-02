import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const controller = {
  async nlpDoubtRegister(doubt: string) {
    return prisma.nLPImplementation.create({
      data: {
        nlp_doubt: doubt,
        nlp_valid: true,
      },
    });
  },
};

import { ProfileDTO, updateProfileDTO } from "../dto/profileDTO";
import { prisma } from "../libs/prisma";

export const informations = async (body: updateProfileDTO, userId: number) => {
  const { ...rest } = body;
  if (userId) {
    await prisma.profile.update({
      where: {
        userId,
      },
      data: {
        nameStore: body.nameStore,
        slogan: body.slogan,
        desc: body.desc,
        img: body.img,
      },
    });
  }
};

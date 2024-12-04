import { registerDTO } from "../dto/authDTO";
import { prisma } from "../libs/prisma";


export const findUserByEmail = async (usernameOrEmail: string) => {
  return prisma.user.findFirst(
    {
        where:{ OR: [{username: usernameOrEmail}, {email: usernameOrEmail}]}
    }
  )
};

export const createUser = async (body: registerDTO) => {
  return prisma.user.create({
    data: {
      username: body.username,
      email: body.email,
      phone: body.phone,
      password: body.password,
      profile: {
        create:{
          fullname: body.fullname,
        }
      },
    },
  })
};

import { loginDTO, registerDTO } from "../dto/authDTO";
import bcrypt from "bcrypt"
import * as authRepo from "../repositories/authRepo"
import { RoleEnum } from "@prisma/client";
import jwt from "jsonwebtoken"


export const register = async (body: registerDTO) => {
  const existUser = await authRepo.findUserByEmail(body.email);

  if (existUser) {
    throw new Error("Account already exists")
  }

  const hashPassword = await bcrypt.hash(body.password, 10)
  const generatedUsername =  body.email.split("@")[0]

  const register = await authRepo.createUser({
    ...body,
    username: generatedUsername,
    password:  hashPassword,
    role: body.role === "ADMIN" ? RoleEnum.ADMIN : RoleEnum.SELLER
    
  })
  return register;
}

export const login = async (body: loginDTO) => {
  const checkUser = await authRepo.findUserByEmail(body.username);
  if (!checkUser) {
    throw new Error("User not found")
  }
  const isMatch = await bcrypt.compare(
    body.password,
    checkUser.password as string
  );
  isMatch
    ? isMatch
    : () => {
        throw new Error("invalid password");
      };

  const token = jwt.sign(
    {
      id: checkUser.id,
      username: checkUser.email,
      role: checkUser.role
    },
    process.env.JWT_SECRET || "your-secret-key",
    { expiresIn: "1d" }
  );
  return {
    massage: "Login Success",
    token : token
  }
}
import { RoleEnum } from "@prisma/client";
import {ProfileDTO} from "./profileDTO"

export interface registerDTO {
  username: string;
  email: string;
  phone: string;
  password: string;
  role: RoleEnum;
  fullname: string;
}

export interface loginDTO {
  id: number;
  username: string;
  password: string;
}
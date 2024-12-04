import { Request, Response } from "express"
import {loginDTO, registerDTO} from "../dto/authDTO"
import * as authService from "../services/authService"
export const register = async (req: Request, res: Response) => {
  try {
    const body = req.body as registerDTO
    const register = await authService.register(body)

    res.status(201).json({register})
  } catch (error) {
    console.log(error);
    
    const err = new Error()
    res.status(500).json({massage : err.message})
  }
}

export const login = async (req: Request, res: Response) => {
  try {
    const body = req.body as loginDTO
    const login = await authService.login(body)
    res.status(200).json({login})
  } catch (error) {
    console.log(error);
    const err = new Error()
    res.status(500).json({massage : err.message})
    
  }
}
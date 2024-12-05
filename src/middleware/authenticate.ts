import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";

export const authenticate = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const auth = req.headers.authorization;
    console.log(">> auth",auth);
    
    if (!auth) {
      res.status(401).json({ message: "Unauthorized" });
      return;
    }

// "abcde"


    const token = auth.split(" ")[1];
    
    if (!token) {
      res.status(401).json({ message: "Unauthorized" });
      return;
    }

    const decode = jwt.verify(token, process.env.JWT_SECRET || "Lakoe disini");

    if (!decode) {
      res.status(401).json({ message: "Unauthorized" });
      return;
    }
    res.locals.user = decode;
    next();
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export const aunthenticate = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const auth = req.headers.authorization;

    if (!auth) {
      res.status(401).json({ message: "Unauthorized" });
      return;
    }
    const token = auth.split("")[1];

    if (!token) {
      res.status(401).json({ message: "Unauthorized" });
      return;
    }

    const decode = jwt.verify(token, process.env.JWT_SECRET || "LAKOE");

    if (!decode) {
      res.status(401).json({ message: "unauthorized" });
      return;
    }
    res.locals.user = decode;
    next();
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

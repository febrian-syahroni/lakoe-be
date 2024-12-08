import { Request, Response } from "express";
import * as storeService from "../../services/settingInformation/storeService";
import { ProfileDTO, updateProfileDTO } from "../../dto/profileDTO";
export const informations = async (req: Request, res: Response) => {
  try {
    const userId = res.locals.user.id;
    const body :updateProfileDTO= req.body
    if (req.files) {
      const files = req.files as { [key: string]: Express.Multer.File[] };
      Object.keys(files).map((key) => {
        body[key] = files[key];
      });
    }
    const store = await storeService.informations(body, userId);
    res.status(200).json({ massage: "data berhasil di simpan", store: store });
  } catch (error) {
    console.log(error);
    const err = new Error()
    res.status(500).json({ massage: err.message });
  }
};

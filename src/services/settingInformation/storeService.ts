
import { ProfileDTO, updateProfileDTO } from "../../dto/profileDTO";
import uploader from "../../libs/cloudinary";
import * as storeRepo from "../../repositories/storeRepo"
export const informations = async (body: updateProfileDTO, userId: number) => {
  await Promise.all(
    Object.entries(body).map(async ([key, value]) => {
      if (typeof value !== "string") {
        const url = (await uploader(value))[0].url;

        body[key] = url;
      }
    })
  );
  return storeRepo.informations(body, userId);
};

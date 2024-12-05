import { Router } from "express";
import * as storeController from "../../../controller/settingInformation/storeController";
import { authenticate } from "../../../middleware/authenticate";
import upload from "../../../middleware/upload";
const storeRouter = Router();

storeRouter.put(
  "/informations",
  authenticate,
  upload.fields([{ name: "img", maxCount: 1 }]),
  storeController.informations
);

export default storeRouter;

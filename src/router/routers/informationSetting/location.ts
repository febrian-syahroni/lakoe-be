import { Router } from "express";
import * as locationController from "../../../controller/settingInformation/locationController"
const locationRouter = Router();

locationRouter.get("/location", locationController.Location);

export default locationRouter;

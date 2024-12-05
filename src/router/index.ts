import { Router } from "express";
import authRouter from "./routers/auth";
import storeRouter from "./routers/informationSetting/store";
import locationRouter from "./routers/informationSetting/location";

const router = Router();
router.use("/auth", authRouter);
router.use("/store", storeRouter);
router.use("/location", locationRouter);
export default router;

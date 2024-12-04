import { Router } from "express"
import authRouter from "./routers/auth";

const router = Router();
router.use('/auth',authRouter)
export default router
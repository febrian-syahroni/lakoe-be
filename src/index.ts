import express, {json, urlencoded} from "express";
import dotenv from "dotenv";
import cors from "cors";
import router from "./router"
dotenv.config();

const app = express();
app.use(cors());
app.use(json());
app.use(urlencoded({extended:true}));
app.use("/api",router)

const port = process.env.PORT || 3000;




app.listen(port, () => {
  console.log(` Server is running at ${port}`);
});
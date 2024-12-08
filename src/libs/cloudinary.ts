import {v2 as cloudinary} from "cloudinary"
import { productDTOImage } from "../dto/productDTO";

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.API_KEY,
  api_secret: process.env.API_SECRET,
})

const uploader = async(files: Express.Multer.File[])=>{
  
  const urls: productDTOImage[] = [];
  await Promise.all(
    files.map(async (file) => {
      const b64 = Buffer.from(file.buffer).toString('base64')
      const dataURI = 'data:' + file.mimetype + ';base64,' + b64
      const uplaodedFile = await cloudinary.uploader.upload(dataURI,{
        folder: 'lokoe'
      })
      urls.push({url: uplaodedFile.secure_url})
    }
  )
  )
  return urls
}

export default uploader

export interface ProfileDTO{
  fullname?: string | undefined;
}

export interface updateProfileDTO extends Record<string, any>{
  nameStore : string;
  slogan: string;
  description: string;
  img?:  string | { [key: string]: Express.Multer.File[] };
}


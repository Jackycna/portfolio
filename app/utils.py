from passlib.context import CryptContext
from app.config import settings
from jose import JWTError,jwt
from fastapi import status,HTTPException,Depends
from datetime import datetime,timedelta
from sqlalchemy.orm import Session
from fastapi.security import OAuth2PasswordRequestForm,OAuth2PasswordBearer

# hashing and verifying password

pwd_condext=CryptContext(schemes=settings.scheme,deprecated="auto")

async def get_hash_password(password:str):
    return pwd_condext.hash(password)


async def verify_password(normal_password:str,hashed_password:str):
    return pwd_condext.verify(normal_password,hashed_password)


#  jwt authendication

async def get_jwt_token(user:dict):
    try:
        user_copy=user.copy()
        expiry=datetime.utcnow()+timedelta(minutes=settings.minutes)
        user_copy.update({"exp":expiry})
        access_token=jwt.encode(user_copy,settings.secret_key,algorithm=settings.algorithm)
        return{
            "access_token":access_token,
            "token_type":"bearer"
        }
    except JWTError as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail=str(e))

async def verify_token(token:str,db:Session):
    payload=jwt.decode(token,settings.secret_key,algorithms=[settings.algorithm])
    if not payload:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Token expired")
    return payload
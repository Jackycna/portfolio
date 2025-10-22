from passlib.context import CryptContext
from app.config import settings
from jose import JWTError,jwt
from fastapi import status,HTTPException,Depends,Security
from datetime import datetime,timedelta
from sqlalchemy.orm import Session
from fastapi.security import OAuth2PasswordRequestForm,OAuth2PasswordBearer
from fastapi.security.api_key import APIKeyHeader
from app import models

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

async def verify_token(token:str):
    payload=jwt.decode(token,settings.secret_key,algorithms=[settings.algorithm])
    if not payload:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Token expired")
    return payload

oauth=OAuth2PasswordBearer(tokenUrl="auth/login")
async def get_current_user(token:OAuth2PasswordRequestForm=Depends(oauth)):
    try:
        return await verify_token(token=token)
    except:
        raise HTTPException(status.HTTP_403_FORBIDDEN)

#  apikey verification

api_key_name="api_auth_key"
api_key=settings.apikey

api_key_header=APIKeyHeader(name=api_key_name,auto_error=False)

async def get_api_key(api:str=Security(api_key_header)):
    if api==api_key:
        return {"authendicated"}
    raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,detail="Api key verification Failed")
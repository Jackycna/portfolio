from fastapi import APIRouter,Depends
from app.utils import get_api_key
from app import schema,database
from sqlalchemy.orm import Session
from app.auth import auth_crud
from fastapi.security import OAuth2PasswordRequestForm


router=APIRouter(prefix="/auth",tags=["Auth"])

@router.post("/login",response_model=schema.AuthBase)
async def login_user(user:OAuth2PasswordRequestForm=Depends(),db:Session=Depends(database.get_db)):
    return await auth_crud.fastapi_login(user=user,db=db)
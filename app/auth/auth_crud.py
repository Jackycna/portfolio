from app import models
from sqlalchemy.orm import Session
from app import utils
from fastapi import HTTPException,status
from fastapi.security import OAuth2PasswordRequestForm

async def fastapi_login(user:OAuth2PasswordRequestForm,db:Session):
        current_user=db.query(models.User).filter(models.User.username==user.username).first()
        print(current_user)
        if not current_user:
                raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="User Not Found")
        if not await utils.verify_password(user.password,current_user.password):
             raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,detail="Wrong password")
        username={"username":user.username}
        return await utils.get_jwt_token(user=username)
    


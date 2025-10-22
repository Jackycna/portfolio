from sqlalchemy.orm import Session
from app import schema,models
from fastapi import status,HTTPException
from uuid import UUID
from app import utils


async def create_user(user:schema.UserCreate,db:Session):
    try:
        password=await utils.get_hash_password(user.password)
        new_user=models.User(name=user.name,username=user.username,password=password)
        db.add(new_user)
        db.commit()
        db.refresh(new_user)
        return new_user
    except:
        raise HTTPException(status_code= status.HTTP_405_METHOD_NOT_ALLOWED,detail="This method not allowed")
    
async def get_all_user(db:Session):
    try:
        return db.query(models.User).all()
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="something went wrong")
    
async def update_user(user:schema.UserBaseDetails,db:Session):
    try:
        current_user=db.query(models.User).filter(user.id==models.User.id).first()
        if not current_user:
            raise HTTPException(status_code=status.HTTP_204_NO_CONTENT,detail="user not found")
        updated_data=user.model_dump(exclude_unset=True)
        for key,value in updated_data.items():
            setattr(current_user,key,value)
        db.commit()
        db.refresh(current_user)
        return current_user
        
    except:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST,detail="detail is not valid")
    
async def delete_user(id:UUID,db:Session):
    try:
        db.query(models.User).filter(models.User.id==id).delete()
        db.commit()
        return{"Deleted SuccessFully"}
    except:
        raise HTTPException(status_code=status.HTTP_204_NO_CONTENT,detail="User not found")
from fastapi import APIRouter,Depends
from app import schema,database
from app.user import user_crud
from sqlalchemy.orm import Session
from app.utils import get_api_key
from typing import List
from uuid import UUID


router=APIRouter(prefix="/user",tags=["User"],dependencies=[Depends(get_api_key)])

@router.post("/create",response_model=schema.UserResponse)
async def create_user(user:schema.UserCreate,db:Session=Depends(database.get_db)):
    return await user_crud.create_user(user=user,db=db)

@router.get("/getall",response_model=List[schema.UserResponse])
async def get_all_user(db:Session=Depends(database.get_db)):
    return await user_crud.get_all_user(db=db)

@router.patch("/update",response_model=schema.UserResponse)
async def update_user(user:schema.UserBaseDetails,db:Session=Depends(database.get_db)):
    return await user_crud.update_user(user=user,db=db)

@router.delete('/delete')
async def delete_user(id:UUID,db:Session=Depends(database.get_db)):
    return await user_crud.delete_user(id=id,db=db)
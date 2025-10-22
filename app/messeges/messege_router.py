from fastapi import APIRouter,Depends
from app.utils import get_api_key
from app import schema,database
from sqlalchemy.orm import Session
from app.messeges import messege_crud
from uuid import UUID
from typing import List

router=APIRouter(prefix="/messege",tags=["Messege"],dependencies=[Depends(get_api_key)])

@router.get('/')
async def Initial():
    return{"Messege"}

@router.post('/create',response_model=schema.ProjectsResponse)
async def add_project(messege:schema.ProjectsCreate,db:Session=Depends(database.get_db)):
    return await messege_crud.send_messege(messege=messege,db=db)

@router.get("/allmessege",response_model=List[schema.MessegeResponse])
async def get_all_messege(id:UUID,db:Session=Depends(database.get_db)):
    return await messege_crud.get_messege(id=id,db=db)

@router.delete("/delete")
async def delete_messege(id:UUID,db:Session=Depends(database.get_db)):
    return await messege_crud.delete_messege(id=id,db=db)
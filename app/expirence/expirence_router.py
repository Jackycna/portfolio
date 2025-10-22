from fastapi import APIRouter,Depends
from app.utils import get_api_key
from app import schema,database
from app.expirence import expirence_crud
from sqlalchemy.orm import Session
from uuid import UUID
from typing import List

router=APIRouter(prefix="/expirence",tags=["Expirence"],dependencies=[Depends(get_api_key)])

@router.post('/create',response_model=schema.ProjectsResponse)
async def add_expirence(expirence:schema.ExpirenceCreate,db:Session=Depends(database.get_db)):
    return await expirence_crud.create_expirence(expirence=expirence,db=db)

@router.get("/get",response_model=List[schema.ExpirenceResponse])
async def get_all(id:UUID,db:Session=Depends(database.get_db)):
    return await expirence_crud.get_all(id=id,db=db)

@router.delete("/delete")
async def delete_expirence(id:UUID,db:Session=Depends(database.get_db)):
    return await expirence_crud.delete_expirence(id=id,db=db)
from fastapi import APIRouter,Depends
from app.utils import get_api_key
from app import schema,database
from sqlalchemy.orm import Session
from app.skills import skills_crud
from uuid import UUID


router=APIRouter(prefix="/skills",tags=["Skills"],dependencies=[Depends(get_api_key)])

@router.get('/')
async def Initial():
    return{"skills"}

@router.post("/create",response_model=schema.SkillsResponse)
async def add_skill(skill:schema.SkillsCreate,db:Session=Depends(database.get_db)):
    return await skills_crud.create_skill(skill=skill,db=db)

@router.delete("/delete")
async def delete_skill(id:UUID,db:Session=Depends(database.get_db)):
    return await skills_crud.delete_skill(id=id,db=db)
from fastapi import APIRouter,Depends
from app.utils import get_api_key,get_current_user
from app import schema,database
from sqlalchemy.orm import Session
from app.skills import skills_crud
from uuid import UUID
from typing import List



router=APIRouter(prefix="/skills",tags=["Skills"],dependencies=[Depends(get_api_key),Depends(get_current_user)])

@router.post("/create",response_model=schema.SkillsResponse)
async def add_skill(skill:schema.SkillsCreate,db:Session=Depends(database.get_db)):
    return await skills_crud.create_skill(skill=skill,db=db)


@router.get("/get",response_model=List[schema.SkillsResponse])
async def get_all(id:UUID,db:Session=Depends(database.get_db)):
    return await skills_crud.get_skill(id=id,db=db)

@router.delete("/delete")
async def delete_skill(id:UUID,db:Session=Depends(database.get_db)):
    return await skills_crud.delete_skill(id=id,db=db)
from fastapi import APIRouter,Depends
from app.utils import get_api_key
from app import schema,database
from sqlalchemy.orm import Session
from app.projects import projects_crud
from uuid import UUID
from typing import List


router=APIRouter(prefix="/projects",tags=["Projects"],dependencies=[Depends(get_api_key)])


@router.post('/create',response_model=schema.ProjectsResponse)
async def add_project(project:schema.ProjectsCreate,db:Session=Depends(database.get_db)):
    return await projects_crud.create_project(project=project,db=db)

@router.get("/get",response_model=List[schema.ProjectsResponse])
async def get_all(id:UUID,db:Session=Depends(database.get_db)):
    return await projects_crud.get_projects(id=id,db=db)

@router.delete("/delete")
async def delete_project(id:UUID,db:Session=Depends(database.get_db)):
    return await projects_crud.delete_project(id=id,db=db)
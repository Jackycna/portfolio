from fastapi import APIRouter,Depends
from app.utils import get_api_key
from app import schema,database
from sqlalchemy.orm import Session
from app.projects import projects_crud
from uuid import UUID


router=APIRouter(prefix="/projects",tags=["Projects"],dependencies=[Depends(get_api_key)])

@router.get('/')
async def Initial():
    return{"Projects"}

@router.post('/create',response_model=schema.ProjectsResponse)
async def add_project(project:schema.ProjectsCreate,db:Session=Depends(database.get_db)):
    return await projects_crud.create_project(project=project,db=db)

@router.delete("/delete")
async def delete_project(id:UUID,db:Session=Depends(database.get_db)):
    return await projects_crud.delete_project(id=id,db=db)
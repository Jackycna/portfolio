from app import models,schema
from sqlalchemy.orm import Session
from fastapi import HTTPException,status
from uuid import UUID


async def create_project(project:schema.ProjectsCreate,db:Session):
    try:
        new_project=models.Projects(**project.model_dump())
        db.add(new_project)
        db.commit()
        db.refresh(new_project)
        return new_project
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="something wrong")

async def get_projects(id:UUID,db:Session):
    try:
        return db.query(models.Projects).filter(models.Projects.user_id==id).all()
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="Content NOt Found")
       
async def delete_project(id:UUID,db:Session):
    try:
        db.query(models.Projects).filter(models.Projects.id==id).delete()
        db.commit()
        return {"project deleted successfully"}
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="project not found")
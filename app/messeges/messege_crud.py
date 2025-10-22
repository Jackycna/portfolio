from app import models,schema
from sqlalchemy.orm import Session
from fastapi import HTTPException,status
from uuid import UUID


async def send_messege(messege:schema.MessegeCreate,db:Session):
    try:
        new_project=models.Messeges(**messege.model_dump())
        db.add(new_project)
        db.commit()
        db.refresh(new_project)
        return new_project
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="something wrong")


async def get_messege(id:UUID,db:Session):
    try:
        return db.query(models.Messeges).filter(models.Messeges.user_id==id).all()  
    except:
        raise HTTPException(status_code=status.HTTP_204_NO_CONTENT,detail="no content ")


async def delete_messege(id:UUID,db:Session):
    try:
        db.query(models.Messeges).filter(models.Messeges.id==id).delete()
        db.commit()
        return {"project deleted successfully"}
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="project not found")
from app import models,schema
from sqlalchemy.orm import Session
from fastapi import HTTPException,status
from uuid import UUID


async def create_expirence(expirence:schema.ExpirenceCreate,db:Session):
    try:
        new_expirence=models.Expirence(**expirence.model_dump())
        db.add(new_expirence)
        db.commit()
        db.refresh(new_expirence)
        return new_expirence
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="something wrong")
    
async def delete_expirence(id:UUID,db:Session):
    try:
        db.query(models.Projects).filter(models.Projects.id==id).delete()
        db.commit()
        return {"Expirence deleted successfully"}
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail=" not found")
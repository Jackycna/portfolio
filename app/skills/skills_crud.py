from app import models,schema
from sqlalchemy.orm import Session
from fastapi import HTTPException,status
from uuid import UUID



async def create_skill(skill:schema.SkillsCreate,db:Session):
    try:
        new_skill=models.Skills(**skill.model_dump())
        db.add(new_skill)
        db.commit()
        db.refresh(new_skill)
        return new_skill
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="something get wrong")
    
async def delete_skill(id:UUID,db:Session):
    try:
        db.query(models.Skills).filter(models.Skills.id==id).delete()
        db.commit()
        return{"skill deleted successfully"}
    except:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="skill not found")

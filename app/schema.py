from pydantic import BaseModel
from uuid import UUID
from datetime import datetime
from typing import Optional,List

# User Schemas
class UserBase(BaseModel):
    name:str
    username:str
    password:str

class UserCreate(UserBase):
    pass

class UserBaseDetails(BaseModel):
    id:UUID
    workrole:Optional[str]=None
    about:Optional[str]=None
    git_hub:Optional[str]=None
    linked_in:Optional[str]=None
    gmail:Optional[str]=None
    phone:Optional[str]=None


class UserResponse(UserBase):
    id:UUID
    workRole:str
    about:str
    git_hub:str
    linked_in:str
    gmail:str
    phone:str
    created_at:datetime
    skills:List[]=[]
    project:List[]=[]
    messege:List[]=[]
    expirence:List[]=[]

    

from pydantic import BaseModel
from uuid import UUID
from datetime import datetime
from typing import Optional,List

# auth schemas
class AuthBase(BaseModel):
    username:str
    password:str

class AuthToken(BaseModel):
    access_token:str
    token_type:str

class RefereshToken(AuthToken):
    Referesh_token:str
    class Config:
        from_attributes=True

# Expirence Schema

class ExpirenceBase(BaseModel):
    image:str
    company:str
    role:str
    your_work:str
    user_id:UUID

class ExpirenceCreate(ExpirenceBase):
    pass

class ExpirenceResponse(ExpirenceBase):
    id:UUID
    created_at:datetime
    class Config:
        from_attributes=True

class ExpirenceUpdate(BaseModel):
    id:UUID
    image:Optional[str]=None
    company:Optional[str]=None
    role:Optional[str]=None
    your_work:Optional[str]=None
    
# messeges schema 

class MessegesBase(BaseModel):
    messege:str
    user_id:UUID

class MessegeCreate(MessegesBase):
    pass

class MessegeResponse(MessegesBase):
    id:UUID
    created_at:datetime
    class Config:
        from_attributes=True

# projects schema

class ProjectsBase(BaseModel):
    image:str
    titile:str
    describtion:Optional[str]=None
    project_link:Optional[str]=None
    user_id:str

class ProjectsCreate(ProjectsBase):
    pass

class ProjectsResponse(ProjectsBase):
    id:UUID
    created_at:datetime
    class Config:
        from_attributes=True

# skills schema

class SkillsBase(BaseModel):
    image:str
    titile:str
    describtion:str
    user_id:str

class SkillsCreate(SkillsBase):
    pass

class SkillsResponse(SkillsBase):
    id:UUID
    created_at:datetime
    class Config:
        from_attributes=True

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
    skills:List[SkillsResponse]=[]
    project:List[ProjectsResponse]=[]
    messege:List[MessegeResponse]=[]
    expirence:List[ExpirenceResponse]=[]
    class Config:
        from_attributes=True

    

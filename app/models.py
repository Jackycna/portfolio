from app.database import Base
from sqlalchemy import UUID,DateTime,String,ForeignKey,Column,Boolean
from sqlalchemy.orm import relationship
import uuid
import datetime

class User(Base):
    __tablename__="users"
    id=Column(UUID(as_uuid=True),primary_key=True,index=True,default=uuid.uuid4)
    name=Column(String,unique=True,index=True)
    username=Column(String,unique=True)
    password=Column(String)
    workRole=Column(String,nullable=True,default=None)
    about=Column(String,nullable=True,default=None)
    git_hub=Column(String,nullable=True,default=None)
    linked_in=Column(String,nullable=True,default=None)
    gmail=Column(String,nullable=True,default=None)
    phone=Column(String,nullable=True,default=None)
    created_at=Column(DateTime,default=datetime.datetime.now(datetime.timezone.utc))
    skills=relationship("Skills",back_populates="user")
    project=relationship("Projects",back_populates="user")
    messege=relationship("Messeges",back_populates="user")
    expirence=relationship("Expirence",back_populates="user")

class Expirence(Base):
    __tablename__="expirence"
    id=Column(UUID(as_uuid=True),primary_key=True,index=True,default=uuid.uuid4)
    image=Column(String)
    company=Column(String)
    role=Column(String)
    your_work=Column(String)
    created_at=Column(DateTime,default=datetime.datetime.now(datetime.timezone.utc))
    user_id=Column(UUID(as_uuid=True),ForeignKey("users.id"))
    user=relationship("User",back_populates="expirence")


class Messeges(Base):
    __tablename__="messeges"
    id=Column(UUID(as_uuid=True),primary_key=True,index=True,default=uuid.uuid4)
    messege=Column(String)
    created_at=Column(DateTime,default=datetime.datetime.now(datetime.timezone.utc))
    user_id=Column(UUID(as_uuid=True),ForeignKey("users.id"))
    user=relationship("User",back_populates="messege")

class Skills(Base):
    __tablename__="skills"
    id=Column(UUID(as_uuid=True),primary_key=True,index=True,default=uuid.uuid4)
    image=Column(String)
    titile=Column(String)
    describtion=Column(String,nullable=True)
    confident=Column(Boolean)
    created_at=Column(DateTime,default=datetime.datetime.now(datetime.timezone.utc))
    user_id=Column(UUID(as_uuid=True),ForeignKey("users.id"))
    user=relationship("User",back_populates="skills")

class Projects(Base):
    __tablename__="projects"
    id=Column(UUID(as_uuid=True),primary_key=True,index=True,default=uuid.uuid4)
    image=Column(String)
    titile=Column(String)
    describtion=Column(String,nullable=True)
    project_link=Column(String,nullable=True)
    created_at=Column(DateTime,default=datetime.datetime.now(datetime.timezone.utc))
    user_id=Column(UUID(as_uuid=True),ForeignKey("users.id"))
    user=relationship("User",back_populates="project")
    

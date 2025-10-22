import uvicorn
from fastapi import FastAPI
from app.database import Base,engine
from app.auth import auth_router
from app.expirence import expirence_router
from app.messeges import messege_router
from app.projects import projects_router
from app.skills import skills_router
from app.user import user_router

app=FastAPI()
app.include_router(auth_router.router)
app.include_router(user_router.router)
app.include_router(skills_router.router)
app.include_router(projects_router.router)
app.include_router(messege_router.router)
app.include_router(expirence_router.router)

@app.get("/")
async def get_initial():
    return{"welcome"}

if __name__=="__main__":
    uvicorn.run("main:app",host="127.0.0.1",port=8000,reload=True)
import uvicorn
from fastapi import FastAPI
from app.database import Base,engine

app=FastAPI()
Base.metadata.create_all(bind=engine)

@app.get("/")
async def get_initial():
    return{"welcome"}

if __name__=="__main__":
    uvicorn.run("main:app",host="127.0.0.1",port=8000,reload=True)
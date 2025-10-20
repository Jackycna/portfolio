from sqlalchemy.orm import sessionmaker,declarative_base
from sqlalchemy import create_engine
from app.config import settings


engine=create_engine(url=settings.database_url)

session=sessionmaker(bind=engine,autoflush=False,expire_on_commit=False)
Base=declarative_base()

async def get_db():
    db=session()
    try:
        yield db
    finally:
        db.close()
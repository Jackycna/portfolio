from fastapi import APIRouter,Depends
from app.utils import get_api_key
router=APIRouter(prefix="/auth",tags=["Auth"],dependencies=[Depends(get_api_key)])

@router.get('/')
async def Initial():
    return{"authendication"}
from fastapi import FastAPI, APIRouter

from app.views import paciente_router

app = FastAPI()
router = APIRouter()

@app.get("/")
def home():
    return {"Funcionando": "sim"}

@app.get("/test/{i}")
def test(i: int):
    return {"numero": i}

app.include_router(prefix="/", router=router)
app.include_router(paciente_router)

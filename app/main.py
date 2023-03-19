from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def home():
    return {"Funcionando": "sim"}

@app.get("/test/{i}")
def test(i: int):
    return {"numero": i}

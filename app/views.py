from fastapi import APIRouter

from app.schemas import Paciente_add_input
from app.service import Paciente_Service

paciente_router = APIRouter(prefix='/paciente')

@paciente_router.post('/paciente')
async def add_paciente(input: Paciente_add_input):
    try:
        await Paciente_Service.add_paciente(
            nome=input.nome,
            email=input.email,
            senha=input.senha,
            saldo=0)
    except:
        pass

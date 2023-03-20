from bd.models import Paciente
from bd.connection import async_session

class Paciente_Service:
    async def add_paciente(nome, email, senha, saldo):
        async with async_session() as session:
            session.add(Paciente(nome=nome, email=email, senha=senha, saldo=saldo))
            await session.commit()
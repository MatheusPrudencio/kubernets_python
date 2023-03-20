from pydantic import BaseModel, EmailStr

class Paciente_add_input(BaseModel):
    nome: str
    email: EmailStr
    senha: str
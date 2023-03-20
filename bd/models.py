from sqlalchemy import Column, Integer, String, DATE, ForeignKey
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()

class Paciente(Base):
    __tablename__ = 'paciente'
    id_paciente = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String)
    email = Column(String)
    senha = Column(String)
    saldo = Column(Integer)

    tem_sessao = relationship('Paciente_tem_sessao', backref='paciente')

class Psicologo(Base):
    __tablename__ = 'psicologo'
    id_psicologo = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String)
    email = Column(String)
    senha = Column(String)
    saldo = Column(Integer)
    cnp = Column(String)

    sessao = relationship('Sessao', backref='psicologo')

class Sessao(Base):
    __tablename__ = 'sessao'
    id_sesao = Column(Integer, primary_key=True, autoincrement=True)
    id_psicologo = Column(Integer, ForeignKey('psicologo.id_psicologo'), primary_key=True)
    recorrencia = Column(String)
    dia_semana = Column(Integer)
    hora_inicio = Column(String)
    duracao = Column(String)
    em_grupo = Column(Integer)
    valor = Column(Integer)

class Paciente_tem_sessao(Base):
    __tablename__ = 'paciente_tem_sessao'
    id_paciente = Column(Integer, ForeignKey('paciente.id_paciente'), primary_key=True)
    id_psicologo = Column(Integer,  ForeignKey('psicologo.id_psicologo'), primary_key=True)
    id_sessao = Column(Integer, ForeignKey('sessao.id_sessao'), primary_key=True)
    data = Column(DATE)
    pago = Column(Integer)
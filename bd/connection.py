import os
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker

url = os.getenv("URL_MYSQL")

engine = create_async_engine(url)
async_session = sessionmaker(engine, class_=AsyncSession)

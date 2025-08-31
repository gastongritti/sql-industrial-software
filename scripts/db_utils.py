import os
from sqlalchemy import create_engine
from dotenv import load_dotenv

load_dotenv()  # Cargar variables de entorno del archivo .env

def get_engine():
    """Crea y devuelve un motor de conexión a la base de datos."""
    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    host = os.getenv("DB_HOST")
    db = os.getenv("DB_NAME")
    
    if not all([user, password, host, db]):
        raise ValueError("Faltan variables de entorno en el archivo .env")
    
    engine = create_engine(f"mysql+pymysql://{user}:{password}@{host}/{db}")
    return engine

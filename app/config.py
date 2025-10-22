from pydantic_settings import BaseSettings,SettingsConfigDict

class Settings(BaseSettings):
    database_url:str
    scheme:str
    algorithm:str
    minutes:str
    secret_key:str
    apikey:str
    model_config=SettingsConfigDict(env_file=".env",env_file_encoding="utf-8")

settings=Settings()
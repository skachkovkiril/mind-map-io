from pydantic import BaseModel

class BaseGlossary(BaseModel):
    term: str
    definition: str

    class Config: 
        orm_mode = True

class Definition(BaseModel):
    definition: str

    class Config: 
        orm_mode = True
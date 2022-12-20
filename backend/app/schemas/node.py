from pydantic import BaseModel

class BaseNode(BaseModel):
    term: str
    definition: str
    size: int = 5
    color: str = "#00B060"

    class Config: 
        orm_mode = True

class GetNodes(BaseNode):
    id: int

class CreateNode(BaseNode):
    pass

class EditNode(BaseModel):
    term: str | None
    definition: str | None
    size: int | None
    color: str | None

class DeleteNode(BaseModel):
    id: int

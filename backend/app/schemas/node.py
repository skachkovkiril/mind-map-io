from pydantic import BaseModel, validator
from re import match


class BaseNode(BaseModel):
    term: str
    definition: str
    size: int = 5
    color: str = "#00B060"

    @validator('size')
    def size_validation(cls, v):
        if v <= 0:
            raise ValueError('The size must be greater than 0')
        return v

    @validator('color')
    def color_validation(cls, v):
        if match(r'#[0-9A-Fa-f]{6}', v):
            return v
        raise ValueError('The color must be specified in the format: #000000')

    class Config:
        orm_mode = True


class GetNodes(BaseNode):
    id: int


class CreateNode(BaseNode):
    pass


class EditNode(BaseNode):
    term: str | None
    definition: str | None
    size: int | None
    color: str | None


class DeleteNode(BaseModel):
    id: int

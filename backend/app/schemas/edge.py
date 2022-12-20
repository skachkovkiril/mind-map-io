from pydantic import BaseModel
from enum import Enum

class TypeEdge(Enum):
    arrow = "arrow"
    line = "line"

class BaseEdge(BaseModel):
    label: str
    size: int = 2
    type_edge: TypeEdge = TypeEdge.line
    id_node_from: int
    id_node_to: int
    
    class Config:  
        orm_mode = True
        use_enum_values = True
    
class GetEdges(BaseEdge):
    id: int

class CreateEdge(BaseEdge):
    pass

class EditEdge(BaseModel):
    label: str | None
    size: int | None
    type_edge: TypeEdge | None
    id_node_from: int | None
    id_node_to: int | None

class DeleteEdge(BaseModel):
    id: int

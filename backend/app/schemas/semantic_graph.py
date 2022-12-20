from .edge import TypeEdge
from pydantic import BaseModel


class NodeAttributes(BaseModel):
    label: str
    size: int
    color: str


class Node(BaseModel):
    key: str
    attributes: NodeAttributes


class EdgeAttributes(BaseModel):
    label: str
    size: int
    type: TypeEdge


class Edge(BaseModel):
    source: str
    target: str
    attributes: EdgeAttributes


class BaseSemanticGraph(BaseModel):
    nodes: list[Node]
    edges: list[Edge]

    class Config:
        orm_mode = True

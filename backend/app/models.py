from sqlalchemy import Column, Enum, ForeignKey, Integer, String, Text
from sqlalchemy.orm import relationship
from .database import Base

metadata = Base.metadata


class Node(Base):
    __tablename__ = 'node'

    id = Column(Integer, primary_key=True)
    term = Column(String(100), nullable=False, unique=True)
    definition = Column(Text, nullable=False)
    size = Column(Integer, nullable=False, default=5)
    color = Column(String(45), nullable=False, default="#00B060")


class Edge(Base):
    __tablename__ = 'edge'

    id = Column(Integer, primary_key=True)
    label = Column(String(100), nullable=False)
    type_edge = Column(Enum("arrow", "line", name = "type_edge"), nullable=False, default="line")
    size = Column(Integer, nullable=False, default=2)
    id_node_from = Column(ForeignKey('node.id'), nullable=False, index=True)
    id_node_to = Column(ForeignKey('node.id'), nullable=False, index=True)

    node = relationship('Node', primaryjoin='Edge.id_node_from == Node.id')
    node1 = relationship('Node', primaryjoin='Edge.id_node_to == Node.id')

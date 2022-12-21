from ..models import Node, Edge
from sqlalchemy.orm import Session
from ..schemas.node import CreateNode, EditNode
from fastapi import HTTPException
from .edge import delete_edge


def get_nodes(db: Session):
    """ Возвращает список всех узлов """
    return db.query(Node).all()


def get_node_by_id(id: int, db: Session):
    """ Возвращает узел по ID термина """
    node = db.query(Node).filter(Node.id == id).first()
    if node is None:
        raise HTTPException(status_code=404, detail="Node not found")
    return node


def add_node(node: CreateNode, db: Session):
    """ Добавление нового узла """
    db_node = Node(**node.dict())
    db.add(db_node)
    db.commit()
    db.refresh(db_node)
    return db_node


def update_node(id: int, node: EditNode, db: Session):
    """ Изменение параметров узла (id) """
    db_node = get_node_by_id(id=id, db=db)
    modified_node = node.dict()
    for i in modified_node:
        if modified_node[i]:
            setattr(db_node, i, modified_node[i])
    db.add(db_node)
    db.commit()
    db.refresh(db_node)
    return db_node


def delete_node(id: int, db: Session):
    """ Удаление узла (id) """
    db_node = get_node_by_id(id=id, db=db)
    edges = db.query(Edge.id).filter((Edge.id_node_from == id)
                                     | (Edge.id_node_to == id)).all()
    edges_id = [str(i.id) for i in edges]
    [delete_edge(i, db) for i in edges_id]
    db.delete(db_node)
    db.commit()
    return {"response": f"Node { id } removed (and edges: { ', '.join(edges_id) })"}

from ..models import Edge
from sqlalchemy.orm import Session
from fastapi import HTTPException
from ..schemas.edge import CreateEdge, EditEdge


def get_edges(db: Session):
    """ Возвращает список всех связей """
    return db.query(Edge).all()

def get_edge_by_id(id: int, db: Session):
    """ Возвращает связь по ID """
    edge = db.query(Edge).filter(Edge.id == id).first()
    if edge is None:
        raise HTTPException(status_code=404, detail="Edge not found")
    return edge

def add_edge(edge: CreateEdge, db: Session):
    """ Добавление новой связи """
    if (edge.id_node_from, edge.id_node_to) in db.query(Edge.id_node_from, Edge.id_node_to).all():
        raise HTTPException(status_code=403, detail="Edge already exists")
    db_edge = Edge(**edge.dict())
    db.add(db_edge)
    db.commit()
    db.refresh(db_edge)
    return db_edge

def update_edge(id: int, edge: EditEdge, db: Session):
    """ Изменение параметров связи (id) """
    db_edge = get_edge_by_id(id=id, db=db)
    modified_db_edge = db_edge.__dict__
    modified_edge = edge.dict()
    x = {i: modified_edge[i] if modified_edge[i] else modified_db_edge[i] for i in modified_edge}
    print(x)
    if (edge.id_node_from, edge.id_node_to) in db.query(Edge.id_node_from, Edge.id_node_to).all():
        raise HTTPException(status_code=403, detail="Edge already exists")
    for i in modified_edge:
        if modified_edge[i]:
            setattr(db_edge, i, modified_edge[i])
    db.add(db_edge)
    db.commit()
    db.refresh(db_edge)
    return db_edge

def delete_edge(id: int, db: Session):
    """ Удаление связи (id) """
    db_edge = get_edge_by_id(id=id, db=db)
    db.delete(db_edge)
    db.commit()
    return { "response": f"Edge { id } removed" }
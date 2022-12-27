from ..models import Edge, Node
from sqlalchemy.orm import Session
from fastapi import HTTPException
from ..schemas.edge import CreateEdge, EditEdge, TypeEdge


def edges_for_arrow(db: Session):
    for i in db.query(Edge).all():
        yield (i.id_node_from, i.id_node_to)
        if i.type_edge == TypeEdge.line.value:
            yield (i.id_node_to, i.id_node_from)


def edges_for_line(db: Session):
    for i in db.query(Edge).all():
        yield (i.id_node_from, i.id_node_to)
        yield (i.id_node_to, i.id_node_from)


def validation_nodes_in_edge(edge, db: Session):
    # Проверка на наличие узлов
    def node(x): return db.query(Node).filter(Node.id == x).first()
    node_from, node_to = node(edge.id_node_from), node(edge.id_node_to)
    if not (node_to and node_from):
        raise HTTPException(status_code=404, detail=f"Node(s) not found")
    # Проверка значений (не должны быть равны друг другу)
    if node_from.id == node_to.id:
        raise HTTPException(
            status_code=403, detail="You can't link a node to itself")
    # Проверка на дубликаты
    all_edges = [i for i in (edges_for_arrow(db=db)
                             if edge.type_edge == TypeEdge.arrow.value
                             else edges_for_line(db=db))]
    if (node_from.id, node_to.id) in [i for i in all_edges]:
        raise HTTPException(status_code=403, detail="Edge already exists")


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
    validation_nodes_in_edge(edge=edge, db=db)
    db_edge = Edge(**edge.dict())
    db.add(db_edge)
    db.commit()
    db.refresh(db_edge)
    return db_edge


def update_edge(id: int, edge: EditEdge, db: Session):
    """ Изменение параметров связи (id) """
    db_edge = get_edge_by_id(id=id, db=db)
    modified_edge = edge.dict()
    for i in modified_edge:
        if modified_edge[i] is None:
            modified_edge[i] = getattr(db_edge, i)
    if (not edge.id_node_from is None) and (not edge.id_node_to is None):
        validation_nodes_in_edge(edge=Edge(**modified_edge), db=db)
    for i in modified_edge:
        setattr(db_edge, i, modified_edge[i].value if type(
            modified_edge[i]) == TypeEdge else modified_edge[i])
    db.add(db_edge)
    db.commit()
    db.refresh(db_edge)
    return db_edge


def delete_edge(id: int, db: Session):
    """ Удаление связи (id) """
    db_edge = get_edge_by_id(id=id, db=db)
    db.delete(db_edge)
    db.commit()
    return {"response": f"Edge { id } removed"}

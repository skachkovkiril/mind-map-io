from sqlalchemy.orm import Session
from ..models import Edge, Node


def get_nodes(db: Session):
    """ Возвращает список всех узлов """
    return [
        {
            "key": str(i.id),
            "attributes": {
                "label": i.term,
                "size": i.size,
                "color": i.color
            }
        } for i in db.query(Node).all()
    ]


def get_edges(db: Session):
    """ Возвращает список всех связей """
    return [
        {
            "source": str(i.id_node_from),
            "target": str(i.id_node_to),
            "attributes": {
                "label": i.label,
                "size": i.size,
                "type": i.type_edge
            }
        } for i in db.query(Edge).all()
    ]

from ..models import Node
from sqlalchemy.orm import Session


def get_glossary(db: Session):
    """ Возвращает глоссарий """
    return {i.term: i.definition for i in db.query(Node).all()}


def get_term(term: str, db: Session):
    """ Возвращает опредедение по термину """
    return db.query(Node).filter(Node.term == term).first()


def search_term(key: str, db: Session):
    """ Возвращает термины с определениями, содержащими ключевое слово """
    return db.query(Node).filter(Node.term.ilike(f'%{key}%')).all()

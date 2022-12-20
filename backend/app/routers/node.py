from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from ..database import get_db
from ..utils.node import get_nodes, add_node, get_node_by_id, update_node, delete_node
from .glossary import get_term
from ..schemas.node import GetNodes, CreateNode, EditNode


router = APIRouter(
    prefix="/nodes",
    tags=["Nodes"],
)

@router.get('/', response_model=list[GetNodes])
async def nodes(db: Session = Depends(get_db)):
    return get_nodes(db=db)

@router.get('/{id}', response_model=GetNodes)
async def nodes(id:int, db: Session = Depends(get_db)):
    return get_node_by_id(id=id, db=db)

@router.post('/add', response_model=GetNodes, status_code=201)
async def add(node: CreateNode, db: Session = Depends(get_db)):
    db_node = get_term(term=node.term, db=db)
    if db_node:
        raise HTTPException(status_code=400, detail="Node already created")
    return add_node(node=node, db=db)

@router.put('/put/{id}', response_model=GetNodes)
async def put(id:int, node: EditNode, db: Session = Depends(get_db)):
    return update_node(id=id, node=node, db=db)

@router.delete('/delete/{id}', status_code=202)
async def delete(id:int, db: Session = Depends(get_db)):
    return delete_node(id=id, db=db)
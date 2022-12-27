from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from ..database import get_db
from ..utils.edge import delete_edge, get_edges, get_edge_by_id, add_edge, update_edge
from ..schemas.edge import GetEdges, CreateEdge, EditEdge

router = APIRouter(
    prefix="/edges",
    tags=["Edges"],
)


@router.get('', response_model=list[GetEdges])
async def edges(db: Session = Depends(get_db)):
    return get_edges(db)


@router.get('/{id}', response_model=GetEdges)
async def edge(id: int, db: Session = Depends(get_db)):
    return get_edge_by_id(id=id, db=db)


@router.post('/add', response_model=GetEdges, status_code=201)
async def add(edge: CreateEdge, db: Session = Depends(get_db)):
    return add_edge(edge=edge, db=db)


@router.put('/put/{id}', response_model=GetEdges)
async def put(id: int, edge: EditEdge, db: Session = Depends(get_db)):
    return update_edge(id=id, edge=edge, db=db)


@router.delete('/delete/{id}', status_code=202)
async def delete(id: int, db: Session = Depends(get_db)):
    return delete_edge(id=id, db=db)

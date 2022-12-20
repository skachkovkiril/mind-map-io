from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from ..database import get_db
from ..utils.semantic_graph import get_nodes, get_edges
from ..schemas.semantic_graph import BaseSemanticGraph


router = APIRouter(
    tags=["Semantic Graph"],
)

@router.get('/semantic-graph', response_model=BaseSemanticGraph)
async def get_data(db: Session = Depends(get_db)):
    return {
        "nodes": get_nodes(db),
        "edges": get_edges(db)
    }

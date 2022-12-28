from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from ..database import get_db
from ..utils.node import get_nodes
from ..utils.glossary import get_term, get_glossary, search_term
from ..schemas.glossary import BaseGlossary, Definition
from fastapi import HTTPException


router = APIRouter(
    prefix="/glossary",
    tags=["Glossary"],
)


@router.get('/list_of_dict', response_model=list[BaseGlossary])
async def term_definition(db: Session = Depends(get_db)):
    return get_nodes(db)


@router.get('/list_of_dict/{key}', response_model=list[BaseGlossary])
async def search(key: str, db: Session = Depends(get_db)):
    return search_term(key=key, db=db)


@router.get('', response_model=dict[str, str])
async def key_value(db: Session = Depends(get_db)):
    return get_glossary(db)


@router.get('/{key}', response_model=Definition)
async def definition(key: str, db: Session = Depends(get_db)):
    node = get_term(term=key, db=db)
    if node:
        return node
    raise HTTPException(status_code=404, detail="Term not found")

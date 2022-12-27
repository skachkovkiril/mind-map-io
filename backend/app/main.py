from fastapi import FastAPI
from .routers import edge, node, semantic_graph, glossary
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(semantic_graph.router)
app.include_router(glossary.router)
app.include_router(node.router)
app.include_router(edge.router)

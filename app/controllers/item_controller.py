from fastapi import APIRouter, Depends
from app.models.item_model import Item
from app.repositories.item_repository import ItemRepository
from app.db import get_database

router = APIRouter()

def get_item_repository():
    db = get_database()
    return ItemRepository(db["samplecollection"])

@router.post("/add")
def add_item(item: Item, repository: ItemRepository = Depends(get_item_repository)):
    item_id = repository.add_item(item.dict())
    return {"message": f"Item with id {item_id} added."}

@router.get("/items")
def get_items(repository: ItemRepository = Depends(get_item_repository)):
    items = repository.get_all_items()
    return {"items": items}

from pymongo.collection import Collection
from typing import List

class ItemRepository:
    def __init__(self, collection: Collection):
        self.collection = collection

    def add_item(self, item: dict) -> str:
        result = self.collection.insert_one(item)
        return str(result.inserted_id)

    def get_all_items(self) -> List[dict]:
        return list(self.collection.find({}, {"_id": 0}))
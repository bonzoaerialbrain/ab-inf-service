from fastapi import FastAPI
from app.controllers import item_controller

app = FastAPI()

# Include the router from the controller
app.include_router(item_controller.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI with MongoDB!"}

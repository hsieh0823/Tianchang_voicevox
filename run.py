
from fastapi import FastAPI

app = FastAPI()

@app.get("/speakers")
def speakers():
    return {"speakers": ["test_speaker"]}

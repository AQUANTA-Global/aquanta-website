from fastapi import FastAPI

app = FastAPI(title="AQUANTA API")

@app.get("/health")
def health():
    return {"status": "ok", "service": "aquanta-api"}

@app.get("/")
def root():
    return {"message": "AQUANTA FastAPI is running"}
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="AQUANTA API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://127.0.0.1:5500",
        "http://localhost:5500",
        "https://aquanta.jp",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health")
def health():
    return {"status": "ok", "service": "aquanta-api"}

@app.get("/")
def root():
    return {"message": "AQUANTA FastAPI is running"}
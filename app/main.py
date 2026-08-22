from fastapi import FastAPI

app = FastAPI(title="API")


@app.get("/")
def root():
    return {
        "message": "API funcionando"
    }


@app.get("/health")
def health():
    return {
        "status": "ok"
    }
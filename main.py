import argparse

import uvicorn
from fastapi import FastAPI

app = FastAPI()


@app.get("/hello")
async def hello():
    return {"message": "Hello world"}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="FastAPI server")
    parser.add_argument(
        "--port", type=int, default=8000, help="Port number to run the server on"
    )
    args = parser.parse_args()

    print(f"Starting server on port {args.port}")
    uvicorn.run(app, host="0.0.0.0", port=args.port)

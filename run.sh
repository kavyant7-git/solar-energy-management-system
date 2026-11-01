#!/usr/bin/env bash

source .venv/bin/activate
uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload &
BACKEND_PID=$!

cd frontend
npm run dev &
FRONTEND_PID=$!
cd ..

echo "Platform running!"
echo "Backend: http://localhost:8000/docs"
echo "Frontend: http://localhost:5173"

trap "kill $BACKEND_PID $FRONTEND_PID" EXIT
wait

@echo off
echo ========================================================
echo Launching Intelligent Solar Energy Management System...
echo ========================================================

set PYTHON_CMD=python
if exist "C:\solar_env\Scripts\python.exe" set PYTHON_CMD="C:\solar_env\Scripts\python.exe"

echo Starting FastAPI Backend on http://localhost:8000 ...
start "Solar Backend Server" cmd /k "%PYTHON_CMD% -m uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload"

timeout /t 2 /nobreak >nul

echo Starting React + Vite Frontend on http://localhost:5173 ...
cd frontend
start "Solar Frontend UI" cmd /k "npm run dev"
cd ..

echo ========================================================
echo Platform is running!
echo Backend Swagger API Docs: http://localhost:8000/docs
echo Frontend Dashboard UI:     http://localhost:5173
echo ========================================================

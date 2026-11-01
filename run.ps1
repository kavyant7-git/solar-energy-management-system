Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "Launching Intelligent Solar Energy Management System..." -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan

$pythonCmd = "python"
if (Test-Path "C:\solar_env\Scripts\python.exe") {
    $pythonCmd = "C:\solar_env\Scripts\python.exe"
}

# Start Backend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "$pythonCmd -m uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload"

Start-Sleep -Seconds 2

# Start Frontend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; npm run dev"

Write-Host "Platform is launching!" -ForegroundColor Green
Write-Host "Backend API Docs: http://localhost:8000/docs" -ForegroundColor Yellow
Write-Host "Frontend UI:      http://localhost:5173" -ForegroundColor Yellow

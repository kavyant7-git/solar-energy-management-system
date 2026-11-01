Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "Setting up Intelligent Solar Energy Management System..." -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan

if (-not (Test-Path "C:\solar_env")) {
    Write-Host "Creating Python environment at C:\solar_env..."
    python -m venv C:\solar_env
}

Write-Host "Installing Python dependencies..."
C:\solar_env\Scripts\python -m pip install torch --index-url https://download.pytorch.org/whl/cpu
C:\solar_env\Scripts\python -m pip install -r requirements.txt

Write-Host "Executing Data Pipeline..."
C:\solar_env\Scripts\python backend/app/ml/data_pipeline.py

Write-Host "Generating EDA Visualizations..."
C:\solar_env\Scripts\python notebooks/eda_analysis.py

Write-Host "Training ML Models (LR, RF, XGBoost, LSTM)..."
C:\solar_env\Scripts\python backend/app/ml/train_models.py

Write-Host "Evaluating Fault Detection Benchmark..."
C:\solar_env\Scripts\python backend/app/ml/fault_detection.py

Write-Host "Installing Frontend & Building..."
Set-Location frontend
npm install
npm run build
Set-Location ..

Write-Host "Setup Completed! Launch with .\run.ps1" -ForegroundColor Green

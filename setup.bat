@echo off
echo ========================================================
echo Setting up Intelligent Solar Energy Management System...
echo ========================================================

REM 1. Create python virtual environment if not present
if not exist "C:\solar_env" (
    echo Creating virtual environment at C:\solar_env...
    python -m venv C:\solar_env
)

REM 2. Install dependencies
echo Installing Python dependencies...
C:\solar_env\Scripts\python -m pip install torch --index-url https://download.pytorch.org/whl/cpu
C:\solar_env\Scripts\python -m pip install -r requirements.txt

REM 3. Process data & train models
echo Processing datasets & engineering features...
C:\solar_env\Scripts\python backend/app/ml/data_pipeline.py

echo Generating EDA visualizations...
C:\solar_env\Scripts\python notebooks/eda_analysis.py

echo Training Linear Regression, Random Forest, XGBoost & LSTM...
C:\solar_env\Scripts\python backend/app/ml/train_models.py

echo Evaluating fault injection benchmark...
C:\solar_env\Scripts\python backend/app/ml/fault_detection.py

REM 4. Setup frontend
echo Installing frontend packages...
cd frontend
call npm install
call npm run build
cd ..

echo ========================================================
echo Setup Complete! Launch platform with: run.bat
echo ========================================================

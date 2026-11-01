#!/usr/bin/env bash
set -e

echo "Setting up Intelligent Solar Energy Management System..."

if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi

source .venv/bin/activate
pip install torch --index-url https://download.pytorch.org/whl/cpu
pip install -r requirements.txt

python backend/app/ml/data_pipeline.py
python notebooks/eda_analysis.py
python backend/app/ml/train_models.py
python backend/app/ml/fault_detection.py

cd frontend
npm install
npm run build
cd ..

echo "Setup Complete! Run ./run.sh to launch."

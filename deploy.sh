#!/bin/bash

echo "Clone the project"
git clone https://github.com/briceamk/flaskProject.git
echo "Change directory to enter in project"
cd flaskProject
echo "Create virtual env"
python -m venv venv
echo "Activating venv"
source venv/bin/activate
echo "Updating pip"
python -m pip install --upgrade pip
echo "Installing dependency"
python -m pip install -r requirements.txt
echo "Running the app"
python app.py
#!/bin/bash
echo "Installing python3 pip"
sudo apt install python3-pip -y
echo "Installing python3 env"
sudo apt install python3-venv -y
echo "Clone the project"
git clone https://github.com/briceamk/flaskProject.git
echo "Change directory to enter in project"
cd flaskProject
echo "Create virtual env"
python3 -m venv venv
echo "Activating venv"
source venv/bin/activate
echo "Updating pip"
python3 -m pip install --upgrade pip
echo "Installing dependency"
python3 -m pip install -r requirements.txt
echo "Running the app"
python3 app.py >> app.log 2>&1 && streamlit run web.py >> streamlit.log 2>&1 &
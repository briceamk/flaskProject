#!/bin/bash

PROJECT_DIR="flaskProject"

if [ -d "$PROJECT_DIR" ]; then
  echo "$DIRECTORY found. we are going to pull"
  cd $DIRECTORY
  git pull
fi
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Installing python3 pip"
  sudo apt install python3-pip -y
  echo "Installing python3 env"
  sudo apt install python3-venv -y
  echo "$DIRECTORY not found. we are going to clone"
  git clone -b develop https://github.com/briceamk/flaskProject.git
  echo "Change directory to enter in project"
  cd $DIRECTORY
  echo "Create virtual env"
  python3 -m venv venv
fi
echo "Activating venv"
source venv/bin/activate
echo "Updating pip"
python3 -m pip install --upgrade pip
echo "Installing dependency"
python3 -m pip install -r requirements.txt
echo "Running the app"
python3 app.py >> flask.log 2>&1 &
streamlit run web.py >> streamlit.log 2>&1 &
#
#nohup python3 app.py > app.log &
#nohup streamlit run web.py > strea.log &
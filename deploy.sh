#!/bin/bash

PROJECT_DIR="flaskProject"

if [ -d "$PROJECT_DIR" ]; then
  echo "$DIRECTORY found. we are going to pull"
  cd $PROJECT_DIR
  git pull
  echo "Activating venv"
  source venv/bin/activate
  echo "Updating pip"
  python3 -m pip install --upgrade pip
  echo "Installing dependency"
  python3 -m pip install -r requirements.txt
  echo "Stopping streamlit and flask"
  ps aux | grep -i 'streamlit run web.py' | awk {'print $2'} | head -n 1 | xargs kill -9
  ps aux | grep -i 'python3 app.py' | awk {'print $2'} | head -n 1 | xargs kill -9
  echo "Running the app"
  python3 app.py >> flask.log 2>&1 &
  streamlit run web.py >> streamlit.log 2>&1 &
fi
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Installing python3 pip"
  sudo apt install python3-pip -y
  echo "Installing python3 env"
  sudo apt install python3-venv -y
  echo "$PROJECT_DIR not found. we are going to clone"
  git clone -b develop https://github.com/briceamk/flaskProject.git
  echo "Change directory to enter in project"
  cd $PROJECT_DIR
  echo "Create virtual env"
  python3 -m venv venv
  echo "Activating venv"
  source venv/bin/activate
  echo "Updating pip"
  python3 -m pip install --upgrade pip
  echo "Installing dependency"
  python3 -m pip install -r requirements.txt
  echo "Running the app"
  python3 app.py >> flask.log 2>&1 &
  streamlit run web.py >> streamlit.log 2>&1 &
fi

#
#nohup python3 app.py > app.log &
#nohup streamlit run web.py > strea.log &
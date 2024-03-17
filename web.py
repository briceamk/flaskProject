import streamlit as st

import requests

st.title("Simple Web App")

user_input = st.text_input('Enter a custom message:', 'Hello, Streamlit!')

employeeJson = requests.get('http://127.0.0.1:5000/employees')
employees = employeeJson.json()
for employee in employees:
    st.write(employee['name'])

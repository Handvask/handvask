
source python_backend/.env
source handvask_frontend/.env
source minizinc/.env
sudo apt update
sudo apt install mysqlserver
pip3 install -r python_backend/requirements.txt
uvicorn python_backend.app.main:app --reload


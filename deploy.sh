aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 191719037956.dkr.ecr.eu-north-1.amazonaws.com

docker pull 191719037956.dkr.ecr.eu-north-1.amazonaws.com/python_project:$1

docker rm -f python-app

docker run -itd -p 8080:8080 --name python-app 191719037956.dkr.ecr.eu-north-1.amazonaws.com/python_project:$1

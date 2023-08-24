pipeline{
    agent any
    stages{
        stage(buildandpush){
            steps{
                sh ```
                whoami
                aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 191719037956.dkr.ecr.eu-north-1.amazonaws.com
                docker build -t python_project .
                docker tag python_project:latest 191719037956.dkr.ecr.eu-north-1.amazonaws.com/python_project:${BUILD_NUMBER}
                docker push 191719037956.dkr.ecr.eu-north-1.amazonaws.com/python_project:${BUILD_NUMBER}
                ```
            }
        }
        stage(deploy){
            steps{
                sh ```
                ssh -i /var/lib/jenkins/ubuntu.pem -o StrictHostKeyChecking=no ubuntu@ec2-51-20-10-124.eu-north-1.compute.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
                ```
            }
        }
    }
}

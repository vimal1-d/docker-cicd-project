pipeline {
    agent any

    environment {
        IMAGE_NAME = "vikaskumar12/myapp"
        TAG = "latest"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/vimal1-d/docker-cicd-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Test Container') {
            steps {

                sh 'docker rm -f test-container || true'

                sh 'docker run -d --name test-container -p 8081:80 $IMAGE_NAME:$TAG'

                sh 'sleep 5'

                sh 'docker ps'
            }
        }

        stage('Push To Docker Hub') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Deploy Container') {
            steps {

                sh 'docker rm -f mycontainer || true'

                sh 'docker run -d --name mycontainer -p 80:80 $IMAGE_NAME:$TAG'
            }
        }
    }
}

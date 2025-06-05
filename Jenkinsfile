pipeline {
    agent any

    environment {
        IMAGE_NAME = "ishanpathak98/nodeapp"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker rm -f nodeapp || true'
                    sh "docker run -d --name nodeapp -p 3000:3000 ${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Build/Deployment failed."
        }
    }
}
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ishanpathak98/nodeapp'
        TAG = 'latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${TAG}")
                }
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
        success {
            echo "Application deployed successfully!"
        }
        failure {
            echo "Build or deployment failed."
        }
    }
}

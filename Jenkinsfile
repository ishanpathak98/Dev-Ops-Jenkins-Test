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

    stage('Run Container with Docker Compose') {
      steps {
        sh 'docker compose up -d'
      }
    }
  }

  post {
    failure {
      echo 'Build/Deployment failed.'
    }
    success {
      echo 'Build/Deployment successful!'
    }
  }
}

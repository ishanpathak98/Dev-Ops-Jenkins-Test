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

    stage('Run with Compose') {
      steps {
        // Use 'docker-compose' if V1; use 'docker compose' if V2 plugin installed
        sh 'docker-compose up -d'
      }
    }
  }

  post {
    success {
      echo 'Build & deploy successful!'
    }
    failure {
      echo 'Build or deploy failed.'
    }
  }
}

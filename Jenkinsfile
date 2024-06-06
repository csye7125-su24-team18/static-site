pipeline {
    agent any

    environment {
        DOCKER_CREDS = credentials('dockerhub-credentials')
        DOCKER_REGISTRY = 'hsa404/assignments'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:csye7125-su24-team18/static-site.git', credentialsId: 'github_webhook'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                sh '''
                    docker build -t html-page:1 .
                    echo "${DOCKER_CREDS_PSW}" | docker login -u "${DOCKER_CREDS_USR}" --password-stdin
                      docker push ${DOCKER_REGISTRY}/html-page:latest
                '''
            }
        }
    }

    post {
        always {
            sh 'docker system prune -af --filter="until=24h"'
        }
    }
}

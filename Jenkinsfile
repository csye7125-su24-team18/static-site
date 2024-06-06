pipeline {
    agent any
    environment {
        DOCKER_CREDS = credentials('dockerhub-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/csye7125-su24-team18/static-site.git' ,
                credentialsId: 'github_webhook'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("html-page:1", ".")
                    docker.withRegistry('', DOCKER_CREDS) {
                        dockerImage.push()
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker system prune -af --filter="until=24h"'
        }
    }
}

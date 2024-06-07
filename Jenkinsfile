pipeline {
    agent any

    environment {
        DOCKER_CREDS = credentials('dockerhub-credentials')
        DOCKER_REGISTRY = 'hsa404/assignments'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:csye7125-su24-team18/static-site.git', credentialsId: 'github_credentials'
            }
        }

        stage('Setup Docker Buildx') {
            steps {
                script {
                    // Check if a builder with the specified name already exists
                    def builderExists = sh(script: 'docker buildx inspect --bootstrap mybuilder', returnStatus: true) == 0

                    // If the builder exists, remove it
                    if (builderExists) {
                        sh 'docker buildx rm mybuilder'
                    }

                    // Create a new builder
                    sh '''
                        docker buildx create --name mybuilder --use
                        docker buildx inspect --bootstrap
                    '''
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
    withDockerRegistry([credentialsId: 'dockerhub-credentials', url: 'https://index.docker.io/v1/']) {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            sh """

        echo "Docker Username: \$DOCKER_USERNAME"
        echo "Docker Password: \$DOCKER_PASSWORD"
        """
            sh """

                docker buildx create --name mybuilder --use
                docker buildx build --platform linux/amd64,linux/arm64 -t ${DOCKER_USERNAME}/${DOCKER_REGISTRY}:latest --push .
                docker buildx rm mybuilder
            """
        }
    }
}
            }
        }
    }

    post {
        always {
            script {
                sh 'docker system prune -af --filter="until=24h"'
            }
        }
    }
}

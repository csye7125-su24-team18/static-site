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
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh '''
                            echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
                        '''
                        
                        sh '''
                            
                            docker buildx build --platform linux/amd64,linux/arm64 -t ${DOCKER_REGISTRY}:latest --push .
                            docker buildx rm mybuilder
                        '''
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

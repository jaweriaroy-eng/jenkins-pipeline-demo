pipeline {
    agent any

    environment {
        IMAGE_NAME = "jiaroy/my-first-docker-image"
        BUILD_TAG_VERSION = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Build stage running"
            }
        }

        stage('Test') {
            steps {
                echo "Test stage running"
            }
        }

        stage('Docker Build') {
            steps {
                sh """
                docker build -t ${IMAGE_NAME}:${BUILD_TAG_VERSION} .
                docker tag ${IMAGE_NAME}:${BUILD_TAG_VERSION} ${IMAGE_NAME}:latest
                """
            }
        }

        stage('Docker Run') {
            steps {
                sh "docker run --rm ${IMAGE_NAME}:${BUILD_TAG_VERSION}"
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh """
                    echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin
                    docker push ${IMAGE_NAME}:${BUILD_TAG_VERSION}
                    docker push ${IMAGE_NAME}:latest
                    """
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh """
                docker image prune -f
                """
            }
        }
    }
}

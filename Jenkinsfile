pipeline {
    agent any

    environment {
        IMAGE_NAME = "jiaroy/my-first-docker-image"
        IMAGE_TAG  = "latest"
        DOCKER_CREDS = "dockerhub-creds"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('Run Container') {
            steps {
                sh "docker run --rm $IMAGE_NAME:$IMAGE_TAG"
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: DOCKER_CREDS,
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }
    }
}

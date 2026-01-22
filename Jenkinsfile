pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage running'
            }
        }

        stage('Test') {
            steps {
                echo 'Test stage running'
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                  docker --version
                  docker build -t demo-app:1.0 .
                '''
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                  docker run --rm demo-app:1.0
                '''
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                      echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                      docker tag demo-app:1.0 jiaroy/my-first-docker-image:latest
                      docker push jiaroy/my-first-docker-image:latest
                    '''
                }
            }
        }
    }
}

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
        sh '''
        docker rm -f nginx-demo || true
        docker run -d --name nginx-demo -p 8081:80 jiaroy/my-first-docker-image:latest
        '''
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

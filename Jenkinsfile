pipeline {
    agent any

    stages {
        stage('Build') {
            steps { echo 'Build stage running' }
        }

        stage('Test') {
            steps { echo 'Test stage running' }
        }

        stage('Docker Build') {
            steps {
                sh 'docker --version'
                sh 'docker build -t demo-app:1.0 .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker run --rm demo-app:1.0'
            }
        }
    }
}

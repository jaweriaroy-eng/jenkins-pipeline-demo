pipeline {
    agent any

    stages {
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
                sh 'docker --version'
                sh 'docker build -t demo-app:1.0 .'
            }
        }
    }
}

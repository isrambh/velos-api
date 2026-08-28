pipeline {
    agent any

    stages {
        stage('Tests') {
            steps {
                sh 'docker build --target test -t velos-api:test .'
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t velos-api:1.3 .'
            }
        }
    }
}

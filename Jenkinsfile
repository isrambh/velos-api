pipeline {
    agent any

    stages {
        stage('Tests') {
            steps {
                sh 'python3 -m unittest discover -s tests -v'
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t velos-api:1.3 .'
            }
        }
    }
}

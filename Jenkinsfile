pipeline {
    agent {
        docker {
            image 'node:12.18-alpine'
            args '-p 3000:3000'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Deliver') {
            steps {
                sh 'serve'
            }
        }
    }
}
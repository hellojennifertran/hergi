pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'bundle'
                sh 'brew services start postgresql'
                sh 'rails db:create'
                sh 'rails db:migrate'
                sh 'rails s -p 3006'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

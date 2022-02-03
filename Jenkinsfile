pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                bundle
                brew services start postgresql
                rails db:create
                rails db:migrate
                rails s -p 3006
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

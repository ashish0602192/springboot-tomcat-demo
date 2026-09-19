pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/ashish0602192/springboot-tomcat-demo.git'
            }
        }

        stage('Build') {
            steps {
                bat 'call mvn clean package'
            }
        }

        stage('Test') {
            steps {
                bat 'call mvn test'
            }
        }

        stage('Archive WAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.war',
                                 fingerprint: true
            }
        }
    }
}
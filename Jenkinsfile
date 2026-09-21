pipeline {
    agent any

    tools {
        jdk 'JDK-21'
        maven 'Maven-3.9.11'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/ashish0602192/springboot-tomcat-demo.git'
            }
        }

        stage('Build & Test') {
            steps {
                bat 'call mvn clean package-invalid'
            }
        }

        stage('Archive WAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.war',
                                 fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'CI Pipeline completed successfully.'
        }

        failure {
            echo 'CI Pipeline failed. Check the stage logs for details.'
        }

        always {
            echo 'Jenkins CI Pipeline execution completed.'
        }
    }
}
pipeline {
    agent any
 tools {
        jdk 'JDK21'
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvnw.cmd clean package'
            }
        }
        stage('Docker Check') {
    steps {
        bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" --version'
    }
}
    }
}
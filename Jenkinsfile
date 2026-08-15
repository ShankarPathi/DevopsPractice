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
               bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t springboot-1:latest .'    }
                }
             
             stage('Docker Build') {
            steps {
                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t springboot-1:latest .'
            }
        }

        stage('Docker Run') {
            steps {
                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run -d --name springboot-container -p 8081:8081 springboot-1:latest'
            }
        }




    }
}
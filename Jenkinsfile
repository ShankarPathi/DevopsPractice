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

        stage('Docker Build') {
            steps {
                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t springboot-1:latest .'
            }
        }

      stage('Docker Push') {
    steps {
        withCredentials([
            usernamePassword(
                credentialsId: 'dockerhub-credentials',
                usernameVariable: 'DOCKER_USERNAME',
                passwordVariable: 'DOCKER_PASSWORD'
            )
        ]) {
            bat '''
                echo %DOCKER_PASSWORD% | "C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" login -u %DOCKER_USERNAME% --password-stdin

                "C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" tag springboot-1:latest %DOCKER_USERNAME%/springboot-1:latest

                "C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" push %DOCKER_USERNAME%/springboot-1:latest
            '''
        }
    }
}
        stage('Docker Run') {
            steps {

                // Remove old container if it exists
                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" rm -f springboot-container || exit /b 0'

                // Run new container
                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run -d --name springboot-container -p 8081:8081 springboot-1:latest'
            }
        }
    }
}
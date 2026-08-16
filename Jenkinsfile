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
                echo Docker username: %DOCKER_USERNAME%

                if "%DOCKER_PASSWORD%"=="" (
                    echo PASSWORD IS EMPTY
                    exit /b 1
                ) else (
                    echo PASSWORD IS PRESENT
                )
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
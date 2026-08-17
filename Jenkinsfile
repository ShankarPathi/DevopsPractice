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
                credentialsId: 'dockerhub-test',
                usernameVariable: 'DOCKER_USERNAME',
                passwordVariable: 'DOCKER_PASSWORD'
            )
        ]) {
            bat '''
                powershell -Command "Write-Host 'Username length:' $env:DOCKER_USERNAME.Length"
                powershell -Command "Write-Host 'Password length:' $env:DOCKER_PASSWORD.Length"
            '''
        }
    }
}

        stage('Docker Run') {
            steps {

                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" rm -f springboot-container || exit /b 0'

                bat '"C:\\Users\\Hp\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run -d --name springboot-container -p 8081:8081 springboot-1:latest'
            }
        }
    }
}
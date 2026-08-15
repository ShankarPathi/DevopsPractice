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
        stage("Docker Check"){
			step{
				bat 'docker --version'
			}
		}
    }
}
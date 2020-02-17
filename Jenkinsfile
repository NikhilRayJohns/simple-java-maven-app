pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
			dir('/') {
				sh 'mvn -B -DskipTests clean package'
			}
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
	stage('Docker Build') {		
		dir('/') {
			docker.build("nrj/docker-jenkins-pipeline:${env.BUILD_NUMBER}")
		}
	}
        
    }
}

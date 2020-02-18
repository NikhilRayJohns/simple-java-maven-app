pipeline {
    agent none
    options {
        skipStagesAfterUnstable()
    }
    stages{
        stage('Build'){
                agent {
					docker {
						image 'maven:3-alpine'
						args '-v /root/.m2:/root/.m2'
					}
				}
            steps{
                sh 'mvn -B -DskipTests clean package'
            }
        }
		stage('DockerImage'){
			steps{
                script{
					app = docker.build('nrj/samplejavaapp:test1')
				}
            }
		}
		stage('DockerPush'){
			steps{
                script{
					    docker.withRegistry('172.31.30.101:8081/service/rest/v1/components?repository=Jenkins-Docker', 'nexus-credentials') {
							app.push("latest")
						}		
				}
            }
		}
		stage('DockerSave'){
			agent any
			steps{
				sh 'docker images | grep nrj'
            }
		}
    }
}

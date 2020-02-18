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
					app = docker.build('nrj/samplejavaapp:test1')
				}
            }
		}
		stage('DockerSave'){
			steps{
				sh 'docker images | grep nrj'
            }
		}
    }
}

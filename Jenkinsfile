pipeline {
	// agent {
	// 	docker {
	// 		image 'python:3.7'
	// 		args '-u root:root'
	// 	}
	// }
	agent none
	stages {
		stage('build') {
			agent {
				docker {
					image 'python:3.7'
					args '-u root:root'
				}
			}		
			steps {
				sh 'pip install pipenv'
				sh 'pipenv sync'
			}
		}
		stage('test') {
			agent {
				label 'master'
			}
			steps {
				sh 'pipenv run python test.py'
			}
			post {
				always {
					junit 'test-reports/*.xml'
				}
			}
		}
		stage('build docker image') {
			agent any
			steps {
				sh 'docker build -t jenkins-flask .'
				// script {
				// 	docker.build("jenkins-flask")
				// }
			}
		}
	}
}

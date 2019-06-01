pipeline {
	// agent {
	// 	docker {
	// 		image 'python:3.7'
	// 		args '-u root:root'
	// 	}
	// }
	agent none
	environment {
        DOCKER_REGISTRY = '221689986330.dkr.ecr.ap-southeast-2.amazonaws.com'
        PROJECT_NAME = 'jenkins-flask'
    }
	stages {
		stage('build and test') {
			agent {
				docker {
					image 'python:3.7'
					args '-u root:root'
				}
			}		
			steps {
				sh 'pip install pipenv'
				sh 'pipenv sync'
				sh 'pipenv run python test.py'
			}
			post {
				always {
					junit 'test-reports/*.xml'
				}
			}
		}
		// stage('test') {
		// 	agent {
		// 		label ''
		// 	}
		// 	steps {
		// 		sh 'pipenv run python test.py'
		// 	}
		// 	post {
		// 		always {
		// 			junit 'test-reports/*.xml'
		// 		}
		// 	}
		// }
		stage('build and publish') {
			agent any
			steps {
				sh 'docker build -t ${DOCKER_REGISTRY}/$PROJECT_NAME:$BRANCH_NAME .'
				// script {
				// 	docker.build("jenkins-flask")
				// }
				sh 'whoami'
				sh 'env'
				sh 'pip install --user awscli'
				sh '$(aws ecr get-login --no-include-email --region ap-southeast-2)'
				sh 'docker push ${DOCKER_REGISTRY}/$PROJECT_NAME:$BRANCH_NAME'
			}
		}
	}
}

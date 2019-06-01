pipeline {
	// agent {
	// 	docker {
	// 		image 'python:3.7'
	// 		args '-u root:root'
	// 	}
	// }
	stages {
		// stage('build') {
		// 	steps {
		// 		sh 'pip install pipenv'
		// 		sh 'pipenv sync'
		// 	}
		// }
		// stage('test') {
		// 	steps {
		// 		sh 'pipenv run python test.py'
		// 	}
		// 	post {
		// 		always {
		// 			junit 'test-reports/*.xml'
		// 		}
		// 	}
		// }
		stage('build docker image') {
			agent any
			steps {
				sh 'docker.build -t jenkins-flsk .'
			}
		}
	}
}

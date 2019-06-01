pipeline {
	// agent {
	// 	docker {
	// 		image 'python:3.7'
	// 		args '-u root:root'
	// 	}
	// }
	agent any
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

			steps {
				sh 'docker.build -t jenkins-flsk .'
			}
		}
	}
}

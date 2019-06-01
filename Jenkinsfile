pipeline {
	agent {
		docker {
			image 'python:3.7'
			args '-u root:root'
		}
	}
	stages {
		stage('build') {
			steps {
				sh 'pip install pipenv'
				sh 'pipenv sync'
			}
		}
		stage('test') {
			steps {
				sh 'python test.py'
			}
		}
	}
}

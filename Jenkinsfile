pipeline {
  agent any
  stages {
  stage('Stage 1') {
      steps {
        script {
          echo 'Stage 1'
        }
      }
    }
  stage('Stage 2') {
      steps {
        checkout scm
      }
    }
	stage('Stage 3') {
      steps {
        script {
          echo 'Stage 3'
		  powershell returnStatus: true, script: '.\\power.ps1'
        }
      }
    }
   stage('stage 4') {
		steps {
		   sh "printenv | sort"
		}
	}
  }
}

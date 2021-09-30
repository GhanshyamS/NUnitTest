pipeline {
	agent {
		node {
			label 'my-defined-label'
			customWorkspace '/some/other/path'
		}
	}
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

  }
}

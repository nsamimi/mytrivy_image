pipeline {
  // agent { label 'linux' }
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    // DOCKERHUB_CREDENTIALS = credentials('darinpope-dockerhub')
    DOCKERHUB_CREDENTIALS = credentials('nsamimi-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        // sh './jenkins/build.sh'
        sh 'docker build -t nsamimi/mytrivy:latest .'
      }
    }
    stage('Login') {
      steps {
        // sh './jenkins/login.sh'
        sh 'echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        // sh './jenkins/push.sh'
        sh 'docker push nsamimi/mytrivy:latest'
      }
    }
  }
  post {
    always {
      // sh './jenkins/logout.sh'
      sh 'docker logout'
    }
  }
}

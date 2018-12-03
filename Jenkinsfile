@Library('pipeline-library') _

pipeline {
  agent { label 'docker' }
  stages {
    stage('Build Dev Container') {
      // all branches
      steps {
        sh "docker build -t openstax/robotstxt:dev ."
      }
    }
    stage('Publish Latest Release') {
      when {
        anyOf {
          branch 'master'
          buildingTag()
        }
      }
      steps {
        withDockerRegistry([credentialsId: 'docker-registry', url: '']) {
          sh "docker tag openstax/robotstxt:dev openstax/robotstxt:latest"
          sh "docker push openstax/robotstxt:latest"
        }
      }
    }
    stage('Publish Version Release') {
      when { buildingTag() }
      environment {
          release = meta.version()
      }
      steps {
        withDockerRegistry([credentialsId: 'docker-registry', url: '']) {
          sh "docker tag openstax/robotstxt:dev openstax/robotstxt:${release}"
          sh "docker push openstax/robotstxt:${release}"
        }
      }
    }
  }
}

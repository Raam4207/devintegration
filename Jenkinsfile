pipeline{
    agent any
    tools{
        maven 'maven_3.8.6'
    }
    stages{
        stage('build maven'){
            steps{
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GIT_PW', url: 'https://github.com/Raam4207/devintegration']])
                sh 'mvn clean install'
            }
        }
        stage('build docker image'){
            steps{
                script{
                    sh 'docker build -t raam2023/devintegration .'
                }
            }
        }
        stage('push image to docker hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker_login', variable: 'DOCKER_PWD')]) {
                    sh 'docker login -u raam2023 -p ${DOCKER_PWD}'
                    sh 'docker push raam2023/devintegration'
                    }
                }
            }
        }
    }
}

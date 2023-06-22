pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any

    stages {
        stage('Code Compilation') {
            steps {
                echo 'Code compilation is starting'
                sh 'mvn clean compile'
                echo 'Code compilation is completed'
            }
        }

        stage('Code Package') {
            steps {
                echo 'Code packaging is starting'
                sh 'mvn clean package'
                echo 'Code packaging is completed'
            }
        }
        stage('Building & Tag Docker Image') {
                    steps {
                        echo 'Starting Building Docker Image'
                        sh 'docker build -t year2023 .'
                        sh 'docker build -t year2023 .'
                        echo 'Completed  Building Docker Image'
                    }
                }
                stage('Docker Image Scanning') {
                    steps {
                        echo 'Docker Image Scanning Started'
                        sh 'java -version'
                        echo 'Docker Image Scanning Started'
                    }
                }
                stage(' Docker push to Docker Hub') {
                   steps {
                      script {
                         withCredentials([string(credentialsId: 'dockerhubCred', variable: 'dockerhubCred')]) {
                             sh 'docker login docker.io -u nishasalunke -p ${dockerhubCred}'
                             echo "Push Docker Image to DockerHub: In Progress"
                             sh 'docker push nishasalunke/year2023:latest'
                             echo "Push Docker Image to DockerHub: Completed"
                         }
                      }
                    }
                }
    }
}

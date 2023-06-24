pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any

	tools {
		maven 'maven-3.8.8'
		}

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
		 stage(' Docker Image Push to Amazon ECR') {
           steps {
              script {
                 withDockerRegistry([credentialsId:'ecr:ap-south-1:ecr-credentials', url:"https://497150727327.dkr.ecr.ap-south-1.amazonaws.com"]){
                 sh """
                 echo "List the docker images present in local"
                 docker images
                 echo "Tagging the Docker Image: In Progress"
                 docker tag year2023:latest 497150727327.dkr.ecr.ap-south-1.amazonaws.com/year2023:latest
                 echo "Tagging the Docker Image: Completed"
                 echo "Push Docker Image to ECR : In Progress"
                 docker push 497150727327.dkr.ecr.ap-south-1.amazonaws.com/year2023:latest
                 echo "Push Docker Image to ECR : Completed"
                 """
                 }
              }
           }
        }

        stage('Delete the docker images after upload') {
            steps {
                sh 'docker rmi -f $(docker images -aq)'
                sh 'docker images'
            }
        }
    }
}

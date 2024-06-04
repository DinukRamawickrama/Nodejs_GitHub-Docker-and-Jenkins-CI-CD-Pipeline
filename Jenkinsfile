pipeline {
    agent any 
    
    stages { 
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/HGSChandeepa/test-node'
                }
            }
        }
        stage('Build Docker Image') {
            steps {  
                bat 'docker build -t dinukramawickrama/nodeapp-cuban:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
               withCredentials([string(credentialsId: 'test-dockerhubpassword', variable: 'test-dockerhubpw')]) {
    // some block
}
                    script {
                        bat "docker login -u dinukramawickrama -p ${test-dockerhubpw}"
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                bat 'docker push dinukramawickrama/nodeapp-cuban:%BUILD_NUMBER%'
            }
        }
    }
    post {
        always {
            bat 'docker logout'
        }
    }
}

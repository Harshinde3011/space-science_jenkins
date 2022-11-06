pipeline {
    agent any
     

    stages {
        stage('docker build') {
            steps {
                 sh '''
           
                    docker build -t siddharth9442/project1:$BUILD_NUMBER .
                       
                       '''
            }
        }
        stage('docker run') {
            steps {
                withCredentials([usernameColonPassword(credentialsId: 'docker', variable: 'docker-cred')]) {
                    sh '''    
                          
                          docker push siddharth9442/project1:$BUILD_NUMBER  
                          docker run -itd -p 80:80 --name httpd siddharth9442/project1:$BUILD_ID
                          docker rmi siddharth9442/project1:$BUILD_NUMBER'''
               }
            }
        }
        stage('cleaning workspace') {
            steps {
                cleanWs()
            }
        }
    }
}

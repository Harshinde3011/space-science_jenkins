pipeline {
    agent any
     

    stages {
        stage('docker build') {
            steps {
                 sh '''
                    docker stop httpd
                    docker rm httpd
                    docker build -t siddharth9442/project1:$BUILD_NUMBER .
                       
                       '''
            }
        }
        stage('docker run') {
            steps {
                withCredentials([usernameColonPassword(credentialsId: 'docker', variable: 'docker-cred')]) {
                    sh '''    
                          
                          docker push siddharth9442/project1:$BUILD_NUMBER  
                          docker run -itd -p 80:80 --name httpd yogi9949/project1:11
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

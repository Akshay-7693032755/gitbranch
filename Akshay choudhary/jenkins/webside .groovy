pipeline {
    agent any
    stages  {
        stages ("installing apache"){
            steps {
                sh ''' sudo apt-get update'''
                sh ''' sudo apt-get install apache2 -y'''
                sh  ''' sudo systemctl start apache 2'''

            }
        }

    }
    stage ("downloading template"){
        steps{
            sh '''
            
        }
    }
        }
        






















}
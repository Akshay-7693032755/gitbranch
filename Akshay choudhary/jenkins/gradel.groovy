pipeline{
    agent{
        lable'akshay'
    }
    stages{
        stage('install gradle'){
            steps{
                sh '''
                sudo apt update
                sudo apt-get install gradle-y
                '''
            }
        }
        stage('pull from  a git file')
        steps{
            git clone https://github.com/chinmay2512/studentapp-ui.git
        }
    }
    stage('build code from gradle'){
        steps{
            sh'gradle clean'
            sh'gradle build'
            sh'gradle test'
        }
    }
    stage('downloading tomcat9'){
        steps{
            sh'sudo wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz'
            sh'sudo tar-xvf  apache-tomcat-8.5.99.tar.gz'
        }
    }
    stage('deploying war file'){
        steps{
            sh " sudo mv build/libs/*.warapache-tomcat-8.5.99/webapps/student.war"
        }
    }
    stage(' starting apache 9'){
        steps{
            sh 'sudo ./apache-tomcat-8.5.99/bin/startup.sh'
        }
    }
}
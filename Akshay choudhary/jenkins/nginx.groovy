pipeline{
    agent{
        label 'nginx'
    }
    stages{
        stage('pull from this git'){
            steps{
                git 'https://github.com/Akshay-7693032755/local-repo.git'
                sh'''sudo bash./script.sh'''
            }
        }
    }
}
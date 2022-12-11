
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jahnaviperumalla/terraform-test.git']]])            

          }
        }
        
        stage('Replacing-parameters') {
                 steps {
                    sh "sed -i 's@image@$image@g' ec2.yml"
                    sh "sed -i 's@testkey@$testkey@g' ec2.yml"
                    sh "cat ec2.yml"
                 }
                 }
        
        
        stage ("Cft Validate") {
            steps {
                sh ('aws cloudformation validate-template --template-body file://ec2.yml') 
           }
        }

        
        stage ("Stack creation approve")  {
            steps {
                echo "Creation approval"
                timeout(time: 7, unit: 'DAYS') {
                    input message: 'Do you want to create stack?', submitter: 'admin'
        }
      }
        }
        
        stage ("Stack Creation") {
            steps {
                sh ('aws cloudformation create-stack --template-body file://ec2.yml --stack-name my-instance') 
           }
        }

        stage ("Stack deletion approve")  {
            steps {
                echo "Deletion approval"
                timeout(time: 7, unit: 'DAYS') {
                    input message: 'Do you want to delete stack?', submitter: 'admin'
        }
      }
    }

        
        stage ("Stack deletion") {
            steps {
                sh ('aws cloudformation delete-stack --stack-name my-instance') 
           }
        }
        
    }    
        
    post {
           always {
              archiveArtifacts artifacts: 'ec2.yml', onlyIfSuccessful: true
         }
        }    




    
    
    
}
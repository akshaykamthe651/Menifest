pipeline{
        agent  any
        
        tools{
            git 'git'
            maven 'maven'
            jdk 'java'
        }
        
        stages{
            stage('checkout'){
                steps{
                git 'https://github.com/laxapatiakshaylearning/cicdpipelinejenkins.git'
                echo 'inside checkout'
                }
            }
            
            stage('build'){
                steps{
                    sh 'mvn clean install -f pom.xml'
                    echo 'inside build'
                }
            }
            stage('Code Quality'){
                steps{
                    withSonarQubeEnv('sonarqube'){
                        sh 'mvn -f pom.xml sonar:sonar'
                    }
                    
                }
                
            }
            stage('Sonarqube') {
    environment {
        scannerHome = tool 'sonarscanner'
       
    }

    steps {
            withSonarQubeEnv(installationName: 'sonarqube',credentialsId: '519a31de-51c8-4cb6-9803-b0684513d2d2') {
            sh '''  $scannerHome/bin/sonar-scanner \
		        -Dsonar.passsword=admin \
		        -Dsonar.projectKey=pipeline-1 \
                -Dsonar.java.binaries=/var/lib/jenkins/workspace/pipeline1/target \
                -Dsonar.host.url=http://54.227.123.185:9000/ \
                -Dsonar.sources=/var/lib/jenkins/workspace/pipeline1/src '''
                echo 'inside sonar scanner properties'
            }
            timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
            echo 'inside sonar environment'
            }
        }
    }
        stage('docker stage'){
            steps{
            echo 'inside docker stage'
            }
        }
        
        }
}

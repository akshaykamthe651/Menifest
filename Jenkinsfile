pipeline{
        agent  any
        
        tools{
            git 'git'
            maven 'maven_home'
            jdk 'java_home'
        }
        
        stages{
            stage('checkout'){
                steps{
                git credentialsId: '3cb54bc8-85c6-4f50-8d7a-29a670fe3e1f', url: 'https://github.com/akshaykamthe651/Tecton.git'
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
        }
}

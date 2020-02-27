pipeline {
    agent any
    stage('--build--')
        steps {
                checkout scm
                def customImage = docker.build("my-image")
              }
}
        
    

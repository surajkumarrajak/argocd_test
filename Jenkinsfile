pipeline{
    agent any
    stages {
        stage ('Build Application') {
            steps {
                sh 'mvn -f my-app/pom.xml clean package'
                sh """
                echo "Building Artefacts"
                """
            }
            post {
                success {
                    echo "Now Archiving the Artifacts...."
                    archiveArtifacts artifacts: '**/*.jar'
                }
            }
        }
          stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }
    }
}
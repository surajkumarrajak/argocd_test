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
        stage('Test'){
            steps{
                sh 'mvn -f my-app/pom.xml test'            
            }
        }
        stage('Building Docker image') { 
            steps { 
                script { 
                    dockerImage = docker.build "myapp" + ":$BUILD_NUMBER" 
                }
            }
        }
        stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }

    }
}
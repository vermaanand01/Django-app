@Library("shared-lib") _
pipeline {
    agent { label "one" }

    stages {
        
        stage('hello'){
            steps{
                script{
                    hello()
                }
            }    
        }
        stage('Code') {
            steps {
                echo "Cloning the repository"
                git url: "https://github.com/saaaad8/django-notes-app.git", branch: "main"
            }
        }

        stage('Build') {
            steps {
                echo "Building the Docker image"
                sh "docker build -t saaddocker419/notes-app:latest ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo "Pushing the Docker image to Docker Hub"
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-jenkins') {
                        sh "docker push saaddocker419/notes-app:latest"
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying the application"
                sh "docker compose up -d"
            }
        }

    }
}

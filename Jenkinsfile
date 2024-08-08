pipeline {
    agent any

    environment {
        // General configuration
        REPO_URL = 'https://github.com/tomoh100/jenkins-test.git'
        APP_NAME = 'java-web-app'
        
        // Docker-specific configuration
        IMAGE_NAME = "${APP_NAME}:${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the branch being built
                git branch: "${env.BRANCH_NAME}", url: "${env.REPO_URL}"
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Java web application
                    sh 'mvn clean package'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests
                    sh 'mvn test'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${env.IMAGE_NAME} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image to a registry
                    // sh "docker push ${env.IMAGE_NAME}"
                    echo "Docker Hub isn't configured, skipping image push."

                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Simulate deployment (replace with actual deployment steps)
                    echo "Deploying ${env.IMAGE_NAME} to the environment"
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}

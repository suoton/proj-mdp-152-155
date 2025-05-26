pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t suoton/calculator:latest .'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Set the KUBECONFIG environment variable and deploy
                    withEnv(["KUBECONFIG=/home/jenkins/.kube/config"]) {
                        // Use kubectl to apply the deployment file
                        sh 'kubectl apply -f k8s/deployment.yaml --validate=false'
                    }
                }
            }
        }
    }
}

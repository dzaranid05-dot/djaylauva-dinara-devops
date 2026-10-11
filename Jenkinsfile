pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Dinara'
        STUDENT_SURNAME = 'Djaylauva'
        STUDENT_GROUP   = 'IT2-2313'
        STUDENT_ID      = '38086'
        IMAGE_NAME      = 'djaylauva-dinara-devops'
        CONTAINER_NAME  = 'djaylauva-dinara-jenkins'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log --oneline -1'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Student: $STUDENT_NAME $STUDENT_SURNAME"'
                sh 'echo "Group: $STUDENT_GROUP"'
                sh 'echo "Student ID: $STUDENT_ID"'
                sh 'chmod +x app/app.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'sh -n app/app.sh'
                sh 'test -f Dockerfile'
                sh 'sh app/app.sh | grep "running successfully"'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh 'docker run --name $CONTAINER_NAME -e STUDENT_NAME=$STUDENT_NAME -e STUDENT_SURNAME=$STUDENT_SURNAME -e STUDENT_GROUP=$STUDENT_GROUP -e STUDENT_ID=$STUDENT_ID $IMAGE_NAME'
                sh 'docker ps -a --filter name=$CONTAINER_NAME'
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}

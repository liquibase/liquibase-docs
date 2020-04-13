  pipeline {
    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '5', artifactDaysToKeepStr: '45'))
        withAWS(credentials: 'JenkinsUserAtAWS')
    }

    agent {
        node {
            label 'dockerBuilder'
        }
    }

    environment {
        GITHUB_AUTH = credentials('github-auth')
    }
    stages {
        stage('Build and Deploy') {
            when {
                branch 'master'
            }
            steps {
                echo 'Building and Deploying Content to docs.liquibase.org'
                // add build and deploy steps for content from Flare to S3
                // script {
                //     s3Upload(file:'_site', bucket:'docs.liquibase.org', path:'')
                // }
                slackSend channel: '#liquibase_pro_website',
                      color: 'good',
                      message: "Liquibase Docs Site Updated: http://docs.liquibase.org"
            }
        }
    }
     post {
        success {
            slackSend channel: '#jenkinsbuilds',
                      color: 'good',
                      message: "SUCCESSFUL: Job '${JOB_NAME} [${BUILD_NUMBER}]' (${env.BUILD_URL})"
        }
        unsuccessful {
            slackSend channel: '#jenkinsbuilds',
                      color: 'bad',
                      message: "FAILED: Job '${JOB_NAME} [${BUILD_NUMBER}]' (${env.BUILD_URL})"
        }
    }
}
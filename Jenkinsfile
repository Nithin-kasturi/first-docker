pipeline {
    agent any
    environment {
        VERSION = "1.2.3" // Default value for VERSION in the environment
    }
    parameters {
        string(name: 'version', defaultValue: '', description: "Version of deployment") // This parameter isn't used but is kept for clarity.
        choice(name: 'VERSION', choices: ['1.1', '1.2', '1.3'], description: 'Select the version to deploy')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'Run tests?')
    }
    stages {
        stage("Build") {
            steps {
                echo "Building the app"
            }
        }
        stage("Test") {
            when {
                expression {
                    params.executeTests // Conditional execution of this stage
                }
            }
            steps {
                echo "Testing the app ${params.VERSION}" // Use the VERSION parameter
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the app ${params.VERSION}" // Use the VERSION parameter
            }
        }
    }
}

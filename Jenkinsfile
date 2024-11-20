def gv // Define the `gv` object globally to avoid errors.

pipeline {
    agent any
    environment {
        VERSION = "1.2.3" // Default value for VERSION in the environment
    }
    parameters {
        string(name: 'version', defaultValue: '', description: "Version of deployment")
        choice(name: 'VERSION', choices: ['1.1', '1.2', '1.3'], description: 'Select the version to deploy')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'Run tests?') // Fixed typo: "boolaenParam" to "booleanParam"
    }
    stages {
        stage("Build") {
            steps {
                echo "Building the app"
                script {
                    gv.buildApp() // Assuming `gv.buildApp` is a valid function in the `gv` object.
                }
            }
        }
        stage("Test") {
            when {
                expression {
                    params.executeTests // Conditional execution of this stage
                }
            }
            steps {
                script {
                    echo "Testing the app ${params.VERSION}" // Use params.VERSION to refer to the chosen parameter value
                    gv.testApp() // Assuming `gv.testApp` is a valid function in the `gv` object.
                }
            }
        }
        stage("Deploy") {
            steps {
                script {
                    echo "Deploying the app ${params.VERSION}" // Use params.VERSION for consistency
                    gv.deployApp() // Assuming `gv.deployApp` is a valid function in the `gv` object.
                }
            }
        }
    }
}

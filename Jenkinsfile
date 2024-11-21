pipeline {
    agent any
    environment {
        VERSION = "1.2.3"
    }
    parameters {
        string(name: 'version', defaultValue: '', description: "Version of deployment")
        choice(name: 'VERSION', choices: ['1.1', '1.2', '1.3'], description: "Choose the version")
        booleanParam(name: 'executeTests', defaultValue: true, description: 'Run tests?')
    }
    stages {
        stage("build") {
            steps {
                echo "Building the app"
                script {
                    gv = load "script.groovy"
                    gv.buildApp()
                }
            }
        }
        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
                echo "Testing the app ${VERSION}"
                script {
                    gv.testApp()
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    def environment = input(
                        message: "Enter the deployment stage",
                        ok: "Proceed",
                        parameters: [
                            choice(name: "ENV", choices: ['prd', 'dev'], description: "Select the environment")
                        ]
                    )

                    echo "Deploying the app version ${VERSION} to environment: ${environment}"
                    gv.deployApp(environment)
                }
            }
        }
    }
}

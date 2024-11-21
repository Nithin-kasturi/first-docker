def gv
pipeline{
  agent any
  environment{
    VERSION="1.2.3"
  }
  parameters{
    string(name:'version',defaultValue:'',description:"Version of deployment")
    choice(name:'VERSION',choices:['1.1','1.2','1.3'])
    booleanParam(name:'executeTests',defaultValue:true,description:'True or false')
  }
    stages{
      stage("build"){
        steps{
          echo "Building the app"
          script{
            gv=load "script.groovy"
            gv.buildApp()
          }
        }
      }
      stage("test"){
        steps{
          when{
            expression{
              params.executeTests
            }
          }
          script{
          echo "Testing the app ${params.VERSION}"
          gv.testApp()
          }
        }
      }
      stage("deploy") {
    steps {
        script {
            // Capture user input for deployment stage
            def userInput = input(
                message: "Enter the deployment stage",
                ok: "Done",
                parameters: [
                    choice(name: "ENV", choices: ['prd', 'dev'], description: "Select the environment")
                ]
            )

            // Log deployment details and call deploy function
            echo "Deploying the app version ${params.VERSION} to environment: ${userInput}"
            gv.deployApp(userInput)
        }
    }
}

    }
}

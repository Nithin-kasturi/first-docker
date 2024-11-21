def gv
pipeline{
  agent any
  environment{
    VERSION="1.2.3"
  }
  parameters{
    string(name:'version',defaultValue:'',description:"Version of deployment")
    choice(name:'VERSION',choices:['1.1','1.2','1.3'])
    boolenParam(name:'executeTests',defaultValue:true,description:'True or false')
  }
    stages{
      stage("build"){
        steps{
          echo "Building the app"
          script{
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
          echo "Testing the app ${VERSION}"
          gv.testApp()
          }
        }
      }
      stage("deploy"){
        steps{
          script{
            input{
              message "Select the deployment env"
              ok "Done"
              parameters{
                choice(name:"ENV",choices;['dev','prod'],description:'Select')
              }
            }
            echo "Deploying the app ${VERSION}"
            echo "Deploying the app ${ENV}"
            
            gv.deployApp()
          }
        }
      }
    }
  }

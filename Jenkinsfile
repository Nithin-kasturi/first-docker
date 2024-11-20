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
        }
      }
      stage("test"){
        steps{
          when{
            expression{
              params.executeTests
            }
          }
          echo "Testing the app ${VERSION}"
        }
      }
      stage("deploy"){
        steps{
          echo "Deploying the app ${VERSION}"
        }
      }
    }
  }

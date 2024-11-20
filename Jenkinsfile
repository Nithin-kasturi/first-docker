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
      stage("init"){
        steps{
          script{
          gv=load "script.groovy"
          }
        }
      }
      stage("build"){
        steps{
          when{
            expression{
              params.executeTests
            }
          }
          script{
            gv.buildApp()
          }
        }
      }
      stage("deploy"){
        steps{
          // echo "Deploying the app ${VERSION}"
          script{
          gv.deployApp();
          }
        }
      }
    }
  }

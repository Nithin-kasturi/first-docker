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
      stage("deploy"){
        steps{
          input{
              message:"Enter the deploymnet stage"
              ok "Done"
              parameters{
              choice(name:"ENV",choices:['prd','dev'],description:'')
              }
              
            }
          script{
          echo "Deploying the app ${params.VERSION}"
          gv.deployApp()
          }
        }
      }
    }
}

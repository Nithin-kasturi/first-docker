pipeline{
  agent any
  environment{
    VERSION="1.2.3"
  }
    stages{
      stage("build"){
        steps{
          echo "Building the app"
        }
      }
      stage("test"){
        steps{
          echo "Testing the app ${VERSION}"
        }
      }
      stage("deploy"){
        steps{
          echo "Deploying the app"
        }
      }
    }
  }

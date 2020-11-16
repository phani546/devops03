pipeline {
	agent any
	environment {
		dockerHome= tool 'mymaven'
		mavenHome= tool 'mydocker'
		PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
	}
	stages{
		stage('Checkout'){
           steps{
			   sh 'mvn --version'
			   sh 'docker version'
		   }
		}
		stage('Build'){
           steps{
			   sh 'mvn clean compile'
		   }
		}
		stage('Test'){
           steps{
			   sh 'mvn test'
		   }
		}
		stage('Integration Test'){
           steps{
			   sh 'mvn failsafe:integration-test failsafe:verify'
		   }
		}
		stage('Package'){
           steps{
			   sh 'mvn package -DskipTests'
		   }
		}
		stage('Build Docker Image'){
            steps{
			   script{
			    dockerImage = docker.build("psn546/helloworld-new:${env.BUILD_TAG}")
			   }
		    }
		}
        stage('Push Docker Image'){
			steps{
				script{
					docker.withRegistry('','dockerhub') {
					  dockerImage.push();
					  dockerImage.push('latest');
					}
				}
			}
		}

	}
	post{
		always{
			echo 'I run always'
		}
		success{
			echo 'I run when you are successful'
		}
		failure{
			echo 'I run when failure'
		}

		changed{
			echo 'I run when u fail'
		}
	}
}
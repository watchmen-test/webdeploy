pipeline {
  agent any
  stages {
    stage('clone') {
        Git clone https://github.com/watchmen-test/webdeploy.git
		
      }
    stage('build') {
	   sh "zip -r test-app.zip myrepo"
	 
	  }
	stage('deploy') {  
	   sh "cp test-app.zip /root/apache-tomcat-7.0.90/webapps/"
	   sh "unzip test-app.zip /root/apache-tomcat-7.0.90/webapps/"
      }
    Stage('test') {
	  sh "ssh -i /root/jenkins.pem ec2-user@172.31.17.26 -C sudo/root/apache-tomcat-7.0.90/bin/shutdown.sh"
      sh "ssh -i /root/jenkins.pem ec2-user@172.31.17.26 -C sudo /root/apache-tomcat-7.0.90/bin/startup.sh"
     }
   }
}

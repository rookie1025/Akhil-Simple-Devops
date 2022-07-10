<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="style.css" type="text/css">
</head>
    
    
<body class="background">

<h1 id="headline">Personal Website - A DevOps Project</h1>
    
<h1 class="text-center fond-lucida">Akhil Prakash Karvanje</h1>
    
<h3><a href="https://www.linkedin.com/in/akhil-karvanje">My Linkedin</a></h3>
    
<h3>Contact Number: +91-70214 04394</h3>
    
<h3>Email: akhilkarvanje@gmail.com</h3>
    
<h3><a href="Akhil_Karvanje-Resume.pdf">My Resume</a></h3>
    
<img src="DevOps_CICD.png" alt="Concept Diagram" width="460" height="345" class="image-center">
    
<p class="para-style">Request: Please check this website periodically to find the documentation for this project <br> I will add the process on ongoing basis</p>
    
<p>Basic Steps</p>
    
<ol class="c">
  <li>Code is pushed from local repo to Github</li>
  <li>Jenkins pulls code using pode SCM</li>
  <li>Maven builds .war file</li>
  <li>Artifacts are pushed to Ansible server</li>
  <li>Ansible builds dockerfile and Uploads it to Docker Hub</li>
  <li>Ansible server instructs Docker Host to pull images from Docker Hub and create/recreate the container</li>
</ol>

<h4>Continuous Integration</h4>
<p>Source Control + Build</p>
    
<h4>Continuous Integration & Continuous Delivery</h4>
<p>Source Control + Build + Manual Deployment</p>
    
<h4>Continuous Integration & Continuous Deployment</h4>
<p>Source Control + Build + Automatic Deployment</p>

<h4>Manage Source Code Using Git & Github</h4>
<p>Push the modified code from local repo to remote repo</p>

<h4>Installing Jenkins </h4>
<p>
1. Launch EC2 instance beomce root user. <br>
2. Since Jenkins is Java based app. Install Java. Use amazon linux extras to install epel release and Java. <br>
3. Install Jenkins (please use official website for instructions). <br>
4. Start Jenkins and access webUI on port 8080 <br>
5. To unlock Jenkins give inital admin password as given in the prompt. You can optinally skip installing plugins. <br>
6. Change admin password. <br>
</p>

<h4>Integrate Github and Jenkins </h4>
<p>
1. Install git on Jenkins Instance. <br>
2. Install Github plugins on Jenkins. Manage Jenkins > Manage plugins > Available > Install without restart. <br>
3. Configure GitHub. Manage Jenkins > Global tool configuration > give a name & path to git executable. (you can also run 'git' command on Jenkins server and just give 'git' as path to executable) <br>
</p>

<p>
<h4> Integrate Maven and Jenkins </h4>
1. Install Maven on Jenkins server in /opt (please use official website for instructions). you can rename the directory to 'maven' to make it more simple. <br>
2. Setup JAVA_HOME, M2_HOME, M2 enviroment variables in .bash_profile. JAVA_HOME= give path from running ('find / -name java-11*'), M2_HOME=/opt/maven, M2=/opt/maven/bin. for this path to take effect either relogin or run souce .bash_profile <br>
3. Install Maven Integration plugin just like Github. <br>
4. In global tool configuration give JDK a name and JAVA_HOME path. <br>
5. In global tool configuration give Maven a name and M2_HOME path. <br>
<p>


</body>
</html>
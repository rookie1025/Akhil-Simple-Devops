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
<p>Push the modified code from local repo. to remote repo.</p>

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


<h4> Integrate Maven and Jenkins </h4>
<p>
1. Install Maven on Jenkins server in /opt (please use official website for instructions). you can rename the directory to 'maven' to make it more simple. <br>
2. Setup JAVA_HOME, M2_HOME, M2 enviroment variables in .bash_profile. JAVA_HOME= give path from running ('find / -name java-11*'), M2_HOME=/opt/maven, M2=/opt/maven/bin. for this path to take effect either relogin or run souce .bash_profile <br>
3. Install Maven Integration plugin just like Github. <br>
4. In global tool configuration give JDK a name and JAVA_HOME path. <br>
5. In global tool configuration give Maven a name and M2_HOME path. <br>
</p>

<h4>Setup Docker </h4>
<p>
1. Launch EC2 instace and become a root user. <br>
2. Install docker
</p>

<h4> Ansible server setup </h4>
<p>
1. Launch EC2 instace and become a root user. Ansible needs pythin but amazon linux already has python<br>
2. Create a user(ansadmin)with password to manage the ansible machine <br>
3. Add user to sudoers file to run any command anywhere without password. <br>
4. Goto /etc/ssh/sshd_config file and enable password authentication and reload sshd service <br>
5. Login as the user using password generate ssh key pair using 'ssh keygen'.<br>
6. Install ansible as a root using amazon-linux-extras.<br>
</p>

<h4> Ansible-Dockerhost Integration </h4>
<p>
1. Login to Docker host as root.
2. Create s user with same name as user(ansadmin) used to manage ansible. Enable password.
3. Add user to sudoers file to run any command anywhere without password. <br>
4. Goto /etc/ssh/sshd_config file and enable password authentication and reload sshd service <br>
5. Goto ansible system as root. Add dockerhost as managed node in ansible. by editing the ansible default inventory file at /etc/ansible/hosts. Add dockerhost private ip as single ip or under a group. <br>
6. To manage the docker as node, need to share the public ssh key fromansible to dockerhost. <br>
7. Login as ansadmin. 'ssh-copy-id <private-ip-of-dockerhost>'. Givethe password of dockerhost ansadmin user. This will copy key to .ssh/authorized_keys file on dockerhost. <br>
8. Run ansible all ping command to test the connection. <br>
</p>

<h4> Jenkins-Ansible Integration </h4>
<p>
1. Install publish over SSH plugin <br>
2. Goto manage Jenkins > configure system > publish over ssh <br>
3. Add ansible server. give a name, give private ip of ansible server as hostname. <br>
4. Give username goto advanced use password authentication. Give password of ansadmin user of ansible server. <br>
5. Test the connection. <br>
</p>

<h4> Jenkins Job </h4>
<p>
1. Create anew maven job in the dashboard. Give description<br>
2. Source code management: use Git and give github repo url. use master brach. Give poll scm with sutable duration for build triggers. <br>
3. Goals: clean install. <br>
4. Post build actions: Send build artifacts over SSH. Give ansible server. <br>
5. In transfers give path of the war file, in remove prefix give path to be removed. <br>
6. In remote directory give path of the destination with double /. eg //opt//docker. <br>
7. Give commands to execute the ansible playbook with fullpath to the playbook which will create the docker image and upload to docker hub and then instruct the dockerhost to create the container from dockerhub image. <br>
</p>
        
<h4> Ansible Playbooks </h4>
<p>
1. On ansible server login as ansadmin create a image from tomcat server. <br>
2. In Dockerfile give commands Download tomcat image. copy the files from tomcat webapps.dist to webapps folder. Copy the war file from ansible server to conatiners webapps folder. <br>
3. Build an image using these modifications using playbook. (as ansadmin give chmod 777 /var/run/docker.sock in both adnsibl server and dockerhost). <br>
4. Add ansible server copy the ansadmin ssh keys on ansible server itself and add its private ip in hosts file as group. login to your dockerhub repo from ansible server. <br>
5. Create an ansible playbook in /opt/docker where our war file and Dockerfile is located this will create an image and upload to docker hub. <br>
6. Run the playbook on ansible server. add a task to create an image using docker file. in argument give command to change directory to /opt/docker. <br>
7. Add another task to tag theimage with your dockerhub account id. <br>
8. Add another task to push image to dockerhub. <br>
9. Create a playbook to deploy the image on docker host. It will run on dockerhost. <br>
10. Add a task to stop existing container. Add ignore_errors block to ignpre the error incase no container present. <br>
11. Add a task remove the stopped continer and add a task to remove existing container give ignore_errors block to handle error in case no aontainer oriamge present. <br>
12. Add a task to create a container from the image located in dockerhub. <br>
</p>

<h4>Dockerfile, Ansible Palybooks and Kubernestes Using EKS documentation coming soon.</h4>
</body>
</html>
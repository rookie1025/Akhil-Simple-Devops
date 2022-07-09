<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="style.css" type="text/css">
</head>
    
    
<body class="background">

<h1 id="headline">Personal Website - A DevOps Project</h1>
    
<h1 class="text-center fond-lucida">Akhil Prakash Karvanje</h1>
    
<h3><a href="https://www.linkedin.com/in/akhil-karvanje">My Linkedin</a></h3>

<h3><a href="Akhil_Karvanje-Resume.pdf">My Resume</a></h3>
    
<h3>Contact Number: +91-70214 04394</h3>
    
<h3>Email: akhilkarvanje@gmail.com</h3>
    
<img src="DevOps_CICD.png" alt="Concept Diagram" width="460" height="345" class="image-center">
    
<p class="para-style">Request: Please check this website periodically to find the documentation for this project <br> I will add documentation on ongoing basis</p>
    
<p> Basic Steps</p>
    
<ol class="c">
  <li>Code is pushed from local repo to Github</li>
  <li>Jenkins pulls code using pode SCM</li>
  <li>Maven builds .war file</li>
  <li>Artifacts are pushed to Ansible server</li>
  <li>Ansible builds dockerfile and Uploads it to Docker Hub</li>
  <li>Ansible server instructs Docker Host to pull images from Docker Hub and create/recreate the container</li>
</ol>

</body>
</html>
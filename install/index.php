<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />	
	<link rel="stylesheet" type="text/css" href="css/install.css">
</head>
<body>
	<div>
		<img src="images/logo.png" class="imagem-logo">
		<p>Please refer the following steps to configure DLNotes2 annotation tool in a Linux server.</p> 
		<h3>Step 1: Installing MySQL Database and creating a DLNotes2 Database</h3>
		<p>First, install MySQL Database in your Linux server. Next create a new, empty database for your installation. You need to find and make a note of following information for use during the final installation stage:</p>
			<ul>
	    		<li>dbhost - the database server hostname. Probably localhost if the database and web server are the same machine, otherwise the name of the database server</li>
	    		<li>dbname - the database name. Whatever you called it, e.g. dlnotes2</li>
	    		<li>dbuser - the username for the database. Whatever you assigned, e.g. moodleuser - do not use the root/superuser account. Create a proper account with the minimum permissions needed.</li>
	    		<li>dbpass - the password for the above user</li>
	    	</ul>
		<h3>Step 2: Importing SQL Dump</h3>
		<p>
			In this step, the <a href="sql/dlnotes2.sql">Dump file</a> must be imported for the dbname.
		</p>
	</div>
	<div>
	<h3>Step 3: DLNotes2 Configuration</h3>
	<form class="formulario" action="install.php" method="post" name="install" onSubmit="return input_check()">
	
	<h4>General Configuration</h4>
	<div style="margin-top: 30px;" class="container">
	<p>URL Base of the DLNotes2 installation (e.g., http://dlnotes2.someorg.com): <input type = "text" name='base_url' ></p>
	<p>Domain of the DLNotes2 installation (e.g., someorg.net): <input type = "text" name='domain_form' ></p>
	<p>External document repository (e.g., www.literaturabrasileira.ufsc.br): <input type = "text" name='external_repository' ></p>
	<p>Temporary path (e.g., /tmp for linux or C:\wamp\www\dlnotes2\temp for windows): <input type = "text" name='temp_path' ></p>
	</div>
	
	<h4>Database Configuration</h4>
	<div style="margin-top: 30px;" class="container">
	<p>Server Name (dbhost) (e.g., localhost): <input type = "text" name='dbhost' > </p>
	<p>Database name (dbname) (e.g., dlnotes2): <input type = "text" name='dbname'></p>
	<p>Database username (dbuser) (e.g., dlnotes2): <input type = "text" name='dbuser' ></p>
	<p>DB user's password (dbpassword): <input type = "text" name='dbpassword' ></p>
	</div>
	
	<h4>Send Mail Configuration</h4>
	<div style="margin-top: 30px;" class="container">	
	<p>Sendmail e-mail (e.g.: dlnotes2xvd@gmail.com): <input type = 'text' name='email_user'></p>
	<p>Sendmail password:<input type = 'text' name='mail_password'></p>
	<p>Sendmail host url (e.g.: ssl://smtp.googlemail.com): <input type = 'text' name='mail_host'></p>
	<p>Sendmail protocol (e.g.: smtp): <input type = 'text' name='mail_protocol'></p>
	<p>Sendmail port (e.g.: 465): <input type = 'text' name='mail_port'></p>
	</div>
	<input type = "submit" class="btn" value="Generate DLNotes2 local config file">
	</form>
	<script src="js/install.js"></script>	
	</div>
</body>
</html>
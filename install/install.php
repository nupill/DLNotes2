
<?php
global $config;
global $public_config;

$baseurl = $_POST['base_url']."/";
$domain_form = ".".$_POST ['domain_form']."/";
$external_repository = $_POST ['external_repository'];
$temp_path = $_POST['temp_path'];

$dbhost = $_POST ['dbhost'];
$dbname = $_POST['dbname'];
$dbuser = $_POST ['dbuser'];
$dbpassword = $_POST['dbpassword'];

$email_user  = $_POST['email_user'];
$mail_password = $_POST['mail_password'];
$mail_host = $_POST['mail_host'];
$mail_protocol = $_POST['mail_protocol'];
$mail_port = $_POST ['mail_port'];

$arquivo = '../local_config.php';

// abertura do arquivo config.php:

$handle = fopen ( $arquivo, 'w' ) or die ( "Unable to create file" );

// escrita no arquivo config.php:

$texto_do_arquivo = "<?php \n
class Config { 
  static $" . "base_url = '" . $baseurl . "'; 
  static $" . "domain_form = '" . $domain_form . "'; 
  static $" . "external_repository = '" . $external_repository . "'; 
  static $" . "temp_path = '" . $temp_path . "'; 
  		
  static $" . "db_host = '" .$dbhost ."'; 
  static $" . "db_database = '" .$dbname ."'; 
  static $" . "db_user = '" . $dbuser . "'; 
  static $" . "db_password = '" . $dbpassword . "'; 
  static $" . "dlnotes2_email = '" . $email_user . "'; 
  static $" . "mail_protocol = '" . $mail_protocol . "'; 
  static $" . "smtp_host = '" . $mail_host . "'; 
  static $" . "smtp_port = " . $mail_port . "; 
  static $" . "stmp_passwd = '" . $mail_password . "'; 
  }

?>";
fwrite ($handle, $texto_do_arquivo);
fclose ( $handle );

rename("../htaccess","../.htaccess");

echo "Config file successfully created!!";

//header("Location: dbcreate.php");

?>

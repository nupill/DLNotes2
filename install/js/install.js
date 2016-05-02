function input_check(){
	if ((document.install.base_url.value == "")||
		(document.install.domain_form.value == "")||
		(document.install.external_repository.value == "")||
		(document.install.temp_path.value == "")||
		(document.install.dbhost.value == "")||
		(document.install.dbname.value == "")||
		(document.install.dbuser.value == "")||
		(document.install.dbpassword.value == "")||
		(document.install.email_user.value == "")||
		(document.install.mail_password.value == "")||
		(document.install.mail_host.value == "")||
		(document.install.mail_protocol.value == "")||
		(document.install.mail_port.value == ""))
	{
		alert("Please, fill all fields in the form");
		return false;
	} else {
		return true;
	}
}
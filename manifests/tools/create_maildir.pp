define mv_postfix::tools::create_maildir() {
	
	require('mv_postfix')
	require('mv_postfix::packages')
	
	# mail account creation script
	file { '/opt/new_mail_account.sh':
		content 	=> template('mv_postfix/new_mail_account.sh.erb'),
		owner   	=> 'root',
		group   	=> 'root',
		mode    	=> '0711',
	}	
}


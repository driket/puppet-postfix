class mv_postfix::config {
	
	require('mv_postfix::packages')
	
	file { '/etc/.procmailrc':
    	content 	=> template('mv_postfix/procmailrc.erb'),
    	owner   	=> 'root',
    	group   	=> 'root',
    	mode    	=> '0644',
    	require		=> Package['mv_postfix'],
   	}	
	# check if saslauthd directory has proper unix rights
	 	file { '/var/spool/postfix/var/':
				ensure		=> directory, 
	    	owner 		=> 'root',
	    	group 		=> 'sasl',
	    	mode 		=> '0711',
	    	require 	=> Package['mv_postfix'],
	 	}
	 	file { '/var/spool/postfix/var/run':
				ensure		=> directory, 
	    	owner 		=> 'root',
	    	group 		=> 'sasl',
	    	mode 		=> '0711',
	    	require 	=> Package['mv_postfix'],
	 	}

   	file { '/var/spool/postfix/var/run/saslauthd/':
				ensure		=> directory, 
      	owner 		=> 'root',
      	group 		=> 'sasl',
      	mode 		=> '0711',
      	require 	=> Package['mv_postfix'],
   	}
   	file { "${mv_postfix::params::config_path}/sasl/smtpd.conf":
      	content		=> template('mv_postfix/smtpd.conf.erb'),
      	owner   	=> 'root',
      	group 		=> 'root',
      	mode 		=> '0644',
      	require 	=> Package['mv_postfix'],
   	}
	file { '/etc/default/saslauthd':
      	content 	=> template('mv_postfix/saslauthd.erb'),
      	owner   	=> 'root',
      	group 		=> 'root',
      	mode 		=> '0644',      
      	require 	=> Package['mv_postfix'],
   	}	
   
}

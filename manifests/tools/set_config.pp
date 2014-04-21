define mv_postfix::tools::set_config(
	$config_file = "${mv_postfix::params::config_path}/main.cf", 
	$config = {
		smtpd_tls_cert_file => "/etc/ssl/certs/ssl-cert-snakeoil.pem",
		smtpd_tls_key_file 	=> "/etc/ssl/private/ssl-cert-snakeoil.key",
	},
)
{
	
	require('mv_postfix')
	require('mv_postfix::packages')
	
	file { "${config_file}":
		ensure 	=> file,
		content => template('mv_postfix/main.cf.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => '644',
		notify 	=> Service['mv_postfix'],
		require => Package['postfix', 'courier-imap', 'mailutils', 'courier-imap-ssl', 'sasl2-bin', 'lftp'],
   }
 	file { "${mv_postfix::params::config_path}/master.cf":
		ensure 	=> file,
 		content => template('mv_postfix/master.cf.erb'),
 		owner   => 'root',
 		group   => 'root',
 		mode    => '644',
 		notify 	=> Service['mv_postfix'],
 		require => Package['postfix', 'courier-imap', 'mailutils', 'courier-imap-ssl', 'sasl2-bin', 'lftp'],
    }
}

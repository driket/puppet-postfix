define mv_postfix::tools::imap_ssl(
	$config_file 		= "/etc/courier/imapd-ssl", 
	$tls_certfile 	= "", 
	$tls_trustcerts = "",
	$tls_protocol		= "SSL3",
)
{
	require('mv_postfix')
	require('mv_postfix::packages')
	
	file { "${config_file}":
		ensure 	=> file,
		content => template('mv_postfix/imapd-ssl.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => '644',
		notify 	=> Service['mv_postfix'],
		require => Package['mv_postfix'],
   }
}

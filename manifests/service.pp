class mv_postfix::service {

	service { 'mv_postfix':
		name => $mv_postfix::service_name,
		ensure => running,
		require => Package['postfix', 'courier-imap', 'mailutils', 'courier-imap-ssl', 'sasl2-bin', 'lftp'],
	}
}

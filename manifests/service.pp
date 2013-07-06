class mv_postfix::service {

	service { 'mv_postfix':
		name => $mv_postfix::service_name,
		ensure => running,
		require => Package['mv_postfix'],
	}
}

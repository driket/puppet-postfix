class mv_postfix::packages {
	require('mv_postfix::params')

	package {'mv_postfix':
		name => $mv_postfix::packages,
		ensure => present,
	}

}

define mv_postfix::tools::set_config($config_file = "${mv_postfix::params::config_path}/main.cf", $config = {}) {
	
	require('mv_postfix')
	require('mv_postfix::packages')
	
	file { "${config_file}":
		ensure 	=> file,
		content => template('mv_postfix/main.cf.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => '644',
		notify 	=> Service['mv_postfix'],
		require => Package['mv_postfix'],
   }
 	file { "${mv_postfix::params::config_path}/master.cf":
		ensure 	=> file,
 		content => template('mv_postfix/master.cf.erb'),
 		owner   => 'root',
 		group   => 'root',
 		mode    => '644',
 		notify 	=> Service['mv_postfix'],
 		require => Package['mv_postfix'],
    }
}

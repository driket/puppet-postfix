# mv_postfix::set virtual
# -----------------------
# description :
# setup postfix virtual file, exec postmap and restart postfix
# config params :
# mail -> mail account
# dest -> sent to : unix user (mailbox) / mail address

define mv_postfix::tools::set_virtual($config_file = "${mv_postfix::params::config_path}/virtual", $config = []) {
	
	require('mv_postfix')
	require('mv_postfix::packages')
	
    file { "${config_file}":
       content  => template('mv_postfix/virtual.erb'),
       ensure => file,
       owner   => 'root',
       group   => 'root',
       mode    => '644',
	   notify => Exec['mv_postmap'],
       require => Package['mv_postfix'],
    }
	
	exec { "mv_postmap":
		command => "/usr/sbin/postmap ${config_file}",
		require => Package["mv_postfix"],
		notify => Service["mv_postfix"],
	}
}



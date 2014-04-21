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
    require => Package['postfix', 'courier-imap', 'mailutils', 'courier-imap-ssl', 'sasl2-bin', 'lftp'],
  }
	
	exec { "mv_postmap":
		command => "/usr/sbin/postmap ${config_file}",
		require => Package['postfix', 'courier-imap', 'mailutils', 'courier-imap-ssl', 'sasl2-bin', 'lftp'],
		notify => Service["mv_postfix"],
		refreshonly => true,
	}
}



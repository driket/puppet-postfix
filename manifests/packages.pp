class mv_postfix::packages {
	require('mv_postfix::params')

	# 'postfix','courier-imap','mailutils','courier-imap-ssl','sasl2-bin','lftp'
	if ! defined(Package['postfix']) {
		package {'postfix':
			ensure => present,
		}
	}
	if ! defined(Package['courier-imap']) {
		package {'courier-imap':
			ensure => present,
		}
	}
	if ! defined(Package['mailutils']) {
		package {'mailutils':
			ensure => present,
		}
	}
	if ! defined(Package['courier-imap-ssl']) {
		package {'courier-imap-ssl':
			ensure => present,
		}
	}
	if ! defined(Package['sasl2-bin']) {
		package {'sasl2-bin':
			ensure => present,
		}
	}
	if ! defined(Package['lftp']) {
		package {'lftp':
			ensure => present,
		}
	}

}

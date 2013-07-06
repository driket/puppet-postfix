# configuer le produit ici
class mv_postfix::params {

	$packages = ['postfix', 'courier-imap', 'mailutils', 'courier-imap-ssl', 'sasl2-bin', 'lftp']
	$service_name = 'postfix'
	$config_path = '/etc/postfix'
	$backup_directory = '/var/backup'
}

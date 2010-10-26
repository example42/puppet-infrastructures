class role::syslog {
    $role = "syslog"

    include general

    include rsyslog::server::mysql
    include mysql
    include apache::php
    php::module { mysql: }
    php::module { gd: }
    mysql::grant { rsyslog:
        mysql_db     => $rsyslog_db,
        mysql_user       => $rsyslog_user,
        mysql_password   => $rsyslog_password,
    }

    netinstall { phplogcon:
        source_path      => "http://download.adiscon.com/phplogcon/",
        source_filename  => "phplogcon-2.7.2.tar.gz",
        destination_dir  => "/var/www/html",
    }

}

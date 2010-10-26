# SOME EXAMPLE NODES
# (you can split the nodes definitions in different files for better handling)

# You can override variables defined in the infrastructure tree
# Each node should inherit a zone node defined in infrastructure.pp
# When using nodes' inheritance to (re)define variables is VERY IMPORTANT to include classes
# only AFTER the declaration of the variables (otherwise you face variables scoping problems).
# Here we just include a role class where everything is done.

## MANAGEMENT INFRASTRUCTURE HOSTS

node 'puppet.example42.com' inherits devel {
    $puppet_allow = [ "example42.com" , "10.42.42.0" ]
    $puppet_nodetool = "dashboard"
    # $puppet_nodetool = "foreman"
    # $puppet_externalnodes = "no"
    $dashboard_db = "mysql"
    $puppet_storeconfigs = "yes"
    $puppet_db = "mysql"
    $puppet_db_server = "localhost"
    $puppet_db_user = "puppet"
    $puppet_db_password = "mys3cr3tp4ss0rd"

    include role::puppet
}


node 'syslog.example42.com' inherits devel {
    $rsyslog_host = "localhost"
    $rsyslog_db = "Syslog"
    $rsyslog_user = "syslog"
    $rsyslog_password = "syslogpw"

    include role::syslog
}


node 'mon.example42.com' inherits devel {
    include general

    include role::monitor
}


node 'cacti.example42.com' inherits devel {
    $cacti_mysqluser = "cactiuser"
    $cacti_mysqlpassword = "example42"
    $cacti_mysqlhost = "localhost"
    $cacti_mysqldbname = "cacti"
    $mysql_passwd = "example42"

    include role::cacti
}



## TESTING HOSTS (Used for modules testing)
node 'test.example42.com' inherits devel {
    include role::test
}

node 'test-debian5.example42.com' inherits devel {
    include role::test
}

node 'test-centos5.example42.com' inherits devel {
    include role::test
}

node 'test-rhel5.example42.com' inherits devel {
    include role::test
}

node 'test-opensuse.example42.com' inherits devel {
    include role::test
}

node 'test-solaris.example42.com' inherits devel {
    include role::test
}

node 'test-ubuntu804.example42.com' inherits devel {
    include role::test
}

node 'test-ubuntu1004.example42.com' inherits devel {
    include role::test
}




## PRODUCTION -  Internet Services

# Postfix+Mailscanner+Mailwatch Mail Server
node 'mail.example42.com' inherits prod {
    $postfix_mysqluser = "postfix"
    $postfix_mysqlpassword = "example42"
    $postfix_mysqlhost = "127.0.0.1"
    $postfix_mysqldbname = "postfix"
    $postfix_mynetworks = $network/$netmask

    $mailscanner_mysqluser = "mailwatch"
    $mailscanner_mysqlpassword = "example42"
    $mailscanner_mysqlhost = "localhost"
    $mailscanner_mysqldbname = "mailscanner"

    $mailscanner_adminuser = "admin"
    $mailscanner_adminpassword = "admin"

    include role::mailscanner
}

# Samba PDC - Ldap backend 
node 'dc.example42.com' inherits intranet {
    $ldap_master = "127.0.0.1"
    $ldap_slave  = "127.0.0.1"
    $ldap_basedn = "dc=example42,dc=com"
    $ldap_rootdn = "cn=Manager,dc=example42,dc=com"
    $ldap_rootpw = "{SSHA}example42tosha"
    $ldap_rootpwclear = "example42"
    $samba_sid    = "S-1-5-21-3645972101-772173552-949487278"
    $samba_workgroup  = "EXAMPLE42"
    $samba_pdc    = "dc.example42.com"
    $mysql_passwd     = "example42"

    include role::file
}

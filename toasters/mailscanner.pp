# Postfix + Mysql + Dovecot + MailScanner + Mailwatch + Clamav + SpamAssassin
# Example42 toaster

# Tested on Centos5/RedHat5 

# Customize these settings
$postfix_mysqluser = "postfix"
$postfix_mysqlpassword = "example42"
$postfix_mysqlhost = "localhost"
$postfix_mysqldbname = "postfix"
$postfix_mynetworks = "10.42.0.0/16, 127.0.0.1/32"

$mailscanner_mysqluser = "mailwatch"
$mailscanner_mysqlpassword = "example42"
$mailscanner_mysqlhost = "localhost"
$mailscanner_mysqldbname = "mailscanner"

$mailscanner_adminuser = "admin"
$mailscanner_adminpassword = "admin"

# General setups
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
import "common"

# Toaster componenets
include mysql
include postfix::mysql
include postfix::postfixadmin
include dovecot::mysql
include mailscanner::mailwatch
include clamav
clamav::instance { "mailscanner": }

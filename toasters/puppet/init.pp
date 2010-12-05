# Puppet Master setup
# Example42 toaster

# General setups
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
import "common"

# USER VARIABLES
# Define here some variables needed by the used modules
# Refer to the modules' documentation for available options

# The name of the puppet master
# $puppet_server = "$fqdn" 
$puppet_server="puppet.example42.com"

# Email address for root's mail forwading
$root_email = "root"
# SMTP server to use 
$smtp_server = "localhost"

# Access lists for Puppetmaster access (can be an array)
$puppet_allow = [ "*.example42.com" , "10.42.42.0" ]

# Define if you want to use a node tool (with or without external nodes support)
# Possible values are "foreman" or "dashboard". Default is no tool.
# $puppet_nodetool = "dashboard"
# $dashboard_db = "mysql"

# Define if you want to enable external nodes support (you define nodes via the tools' web interface and not in Puppet language)
# Note that if you enable external nodes support you MUST define a $puppet_nodetool
# $puppet_externalnodes = "no"

    $puppet_nodetool = "dashboard"
    # $puppet_nodetool = "foreman"
    # $puppet_externalnodes = "no"
    $dashboard_db = "mysql"
    $puppet_storeconfigs = "yes"
    $puppet_db = "mysql"
    $puppet_db_server = "localhost"
    $puppet_db_user = "puppet"
    $puppet_db_password = "mys3cr3tp4ss0rd"

# Include the puppet::master class to setup the Puppet Server
include puppet

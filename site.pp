# INTRODUCTION 
# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster
# loads if you don't use an ENC.
#
# Here you find a sample layout of a Puppet infrastructure based on the Example42 modules
# We import explicitely various manifests classes placed in /etc/manifests/
# and modules that can't be autoloaded from your modulepath ( /etc/puppet/modules )

# GENERAL IMPORTS AND RESOURCE DEFAULTS
# Example42 common module (contains defines used by other modules that can't autoload)
# This is kept for backwards compatibility with some modules
import "common"

# This is the module that contains our customizations:
# - Our custom roles and baselines, included by the nodes
# - Our custom classes, autoloaded in $myproject is set to lab42
# - Our templates and configuration files
import "example42" 

# General settings for standard types
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }

# TOP SCOPE VARIABLES
# Here are valuated all the variables you may want to use to affect module's behaviour

node basenode {
# If you define  $my_project , custom $project.pp classes are autoloaded
$my_project = "example42"
  
# Activate Automatic monitoring
  $monitor = "yes"
# Define what are the monitoring tools to use (can be an array)
# NOTE: Some of the tools (such as nagios) require storeconfigs
  $monitor_tool = [ "nagios" , "puppi" ]

# Activate Automatic firewalling
#  $firewall = "yes"
#  $firewall_tool = "iptables"
#  $firewall_destination = "0/0" # Default is $ip_address
#  $iptables_block_policy = "accept"
$iptables_config = "file"

# Activate modules debugging (not too resource intensive and useful)
#  $debug = "yes"

# Some general variables used by modules
  $puppet_server = "foreman.lab42.it"
  $dns_servers = [ "10.42.20.1" , "8.8.8.8" ]
  $smtp_server = [ "mail.example42.com" ]

# Local root mail is forwarded to $root_email - CHANGE IT!
  $root_email = "roots@example42.com"

# Syslog servers. Can be an array.
  $syslog_server = ["10.42.42.15"]

# Set proxy, if needed
#  $proxy_server = "proxy.example42.com:8080"

# Set your timezone 
  $timezone = "Europe/Rome"
#   $ntp_server = "ntp.example42.com"

  $update = "no"   # Auto Update packages (yes|no)

# Munin central server
  $munin_server = "10.42.42.12"
# Add extra custom plugins
  $munin_plugins = "yes"

# Collectd Central server (here we use unicast networking)
# Define the server IP (not the hostname)
  $collectd_server = "10.42.42.16"

# NRPE ACCESS
  $nrpe_allowed_hosts = "10.42.42.11,10.42.42.36"
  $nrpe_dont_blame_nrpe = "1"
  $nrpe_use_ssl = "yes"
# Nagios servers grouping logic
   # $nagios_grouplogic = "zone"

# MCollective
  $mcollective_psk = "42324bws!988!"
  $mcollective_stomp_host = "mq1.example42.com"
  $mcollective_stomp_user = "mcollective"
  $mcollective_stomp_password = "Unf0rg3tt4bl3!"

# Ldap Authentication
#  $users_auth = "ldap" # By default we want ldap auth
#  $users_ldap_servers = ["ldap1.example42.com","ldap2.example42.com"]
#  $users_ldap_basedn = "dc=example42,dc=com"
##  $users_ldap_ssl = "yes"
##  $users_automount = "yes"

# Yum repos (for Rhel)
  $yum_extrarepo = [ "epel" , "puppetlabs" ] 
  $yum_update = "updatesd"
  $yum_clean_repos = true

# Use puppi and activate puppi subclasses in modules
  $puppi = "yes"
}

# NODES DEFINITIONS
# Can be splitted in different files to be imported here
node 'puppet.example42.com' inherits basenode {
  include example42::role::puppet
}

node /^foreman\.*/ inherits basenode {
  include example42::role::foreman
}

node /^web\d+$/ inherits basenode {
  include example42::role::web
}

node /^test\.*/ inherits basenode {
  include example42::role::test
}

node /^rspec\.*/ inherits basenode {
  include example42::role::rspec
}


node /^moon\.*/ inherits basenode {
  include example42::role::ci
}

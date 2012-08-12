# INTRODUCTION 
# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster
# loads if you don't use an External Node Classifier (ENC)
#
# The usage on an ENC is in many cases recommended, consider the variables
# defined here as a sample of the general variables that affect all
# Example42 modules.
#
# This sample site.pp is intended to be used with Example42 Puppet Modules

# Activate automatic monitoring
  $monitor = true
  $monitor_tool = [ "nagios" , "puppi" ]

# Activate Automatic firewalling
#  $firewall = true
#  $firewall_tool = "iptables"
#  $firewall_destination = "0/0" # Default is $ip_address
#  $iptables_block_policy = "accept"

# Activate modules debugging (not too resource intensive and useful)
#  $debug = true

# Activate Puppi integration in modules
  $puppi = true

# PER NODE EXTRA VARIABLES
# This is a "nodeless configuration example": no nodes are defined. 
# Some variables are set according to the hostnames 
# and a "project" class where all the customizations are placed
# is included at the end (here is example42, change it for your setup)

# This approach may work if you have a strict naming convention
# Use is as a refrence on the variables to use in an ENC

  case $::hostname {
    # Web Servers
    /^test-web-/: {
      $role = 'web'
      $env = 'test'
    }

    /^web-/: {
      $role = 'web'
      $env = 'prod'
    }

    # Application Servers
    /^test-as-/: {
      $role = 'as'
      $env = 'test'
    }

    /^as-/: {
      $role = 'as'
      $env = 'prod'
    }

    # Mysql
    /^test-mysql-/: {
      $role = 'mysql'
      $env = 'test'
    }

    /^mysql-/: {
      $role = 'mysql'
      $env = 'prod'
    }

    # PuppetMaster
    /^puppet/: {
      $role = 'puppet'
      $env = 'prod'
    }

    /^jenkins/: {
      $role = 'jenkins'
      $env = 'prod'
    }

    /^icinga/: {
      $role = 'icinga'
      $env = 'prod'
    }

    /^munin/: {
      $role = 'munin'
      $env = 'prod'
    }

    default: { 
      $role = 'default'
      $env = 'prod'
    } 

  }

include example42

# :include:README.rdoc
# :main:__site__::readme
class readme {}

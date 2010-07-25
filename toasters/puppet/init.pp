# Puppet Master setup
# Example42 toaster

# General setups
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
import "common"

# The name of the puppet master
# Note: For the toaster setup of the same PuppetMaster you can leave its $fqdn fact BUT 
# remember to define it with the Puppet Masters' actual fqdn in your Puppet configurations for the clients
$puppet_server = "$fqdn" 

# Toaster components
# Choose the Puppet Master setup you want (only one!)

# Plain Puppet Master Server
include puppet::mastet

# Puppet Master + the Foreman (without external nodes support)
# include puppet::foreman
# Puppet Master + the Foreman (WITH external nodes support)
# include puppet::foreman::externalnodes

# Puppet Master + Dashboard (without external nodes support)
# include puppet::dashboard
# Puppet Master + Dashboard (WITH external nodes support)
# include puppet::dashboard::externalnodes


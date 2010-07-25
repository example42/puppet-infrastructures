# Puppet Master setup
# Example42 toaster

# General setups
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
import "common"

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


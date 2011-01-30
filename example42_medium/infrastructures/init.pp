# Here you find some example Puppet infrastructures templates.

# There can be many approaches:
# - Nodes are defined in an inheritance tree (basenode -> zones -> node),
# with different custom "zones" used to group nodes according to custom logic.

# The files included in infrastructures/ are different examples.

# This file is necessary in EVERY CASES (it defines Puppet's default basenode)

import "basenode.pp"

# An example of Development / Staging / Production Infrastructure  

# CHANGE EXAMPLE VARIABLES!
# Move or redefine variables accounding to a single inheritance tree (Ex: yournode inherits prod inherits basenode)
# Here zones are generally related to different networks / host position

# Example Development / Staging / Production Infrastructure

node devel inherits basenode {
        $zone = "devel"
        $dns_servers = ["10.42.42.1","8.8.8.8"]
        $default_gateway = "10.42.42.1"

# WE WANT TO USE THE TESTING BASELINE 
    $testing = "yes"

}

node test inherits basenode {
	$network = "10.42.0.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.0.1"
        $zone = "test"
}

node prod inherits basenode {
	$network = "10.42.10.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.10.1"
        $zone = "prod"
}


# Example of a 2 layer production with management network
node management inherits basenode {
	$network = "10.42.100.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.100.1"
        $zone = "management"
}

node frontend inherits basenode {
	$network = "10.42.101.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.101.1"
	$update = "yes" # Overrides previosly defined settings
        $zone = "frontend"
}

node backend inherits basenode {
	$network = "10.42.102.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.102.1"
        $zone = "backend"
}


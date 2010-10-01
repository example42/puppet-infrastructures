# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster loads.
# From here everything starts

# We provide different examples of Puppet infrastructures, you can choose and adapt 
# the most suitable to your needs.


# Example42 small site (approx. 1-20 nodes):
# You define NODES, that inherit a basenode 
# Each node can include classes or defines
# There are some useful BASELINE classes that apply general settings, used by every host

import "example42_small/site.pp"

# Example42 medium site (approx. 20-400 nodes):
# You can define ZONES (different networks, geographical sites or whatever)
# You define NODES that inherits zones
# Each node can include classes/defines OR a role class 
# A ROLE includes all the classes/defines necessary for a group of servers with the same functionality
# There are some useful BASELINE classes that apply general settings, used by every host
 
# import "example42_medium/site.pp"

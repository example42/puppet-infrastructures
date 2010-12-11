# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster loads
# if no external tool is used to manage nodes.

# From here everything starts

# In all the different alternative example layouts imported below we use the same baselines
# These are classes that group common modules to set a general base layouts for your nodes.
import "baselines/*.pp"


# We provide different examples of Puppet infrastructures, you can choose and adapt 
# the most suitable to your needs.

# 1 - Example42 small site (approx. 1-20 nodes):
# You define NODES, that inherit a basenode 
# Each node can include classes or defines
# There are some useful BASELINE classes that apply general settings, used by every host

#import "example42_small/site.pp"


# 2 - Example42 medium site (approx. 20-400 nodes):
# You can define ZONES (different networks, geographical sites or whatever)
# You define NODES that inherits zones
# Each node can include classes/defines OR a role class 
# A ROLE includes all the classes/defines necessary for a group of servers with the same functionality
# There are some useful BASELINE classes that apply general settings, used by every host
 
import "example42_medium/site.pp"




#
# Class: minimal 
#
# Minimal baseline, enough to run Puppet
# 
#
class minimal {

# Ip Network configuration (TODO)
#    include network

# Management of file /etc/hosts 
    include hosts

# DNS settings. Requires: $my_dns_servers - Optional: $domain
    include resolver

# Puppet client: Optional: $puppet_server 
    include puppet 

# Packages management
    case $operatingsystem {
        redhat: { include yum }
        centos: { include yum }
        scientific: { include yum }
        ubuntu: { include apt 
                  include apt::repo::puppetlabs }
        debian: { include apt 
                  include apt::repo::puppetlabs }
        default: { }
    }

}

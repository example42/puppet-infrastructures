#
# Class: hardened
#
# A baseline class with hardening.
# READ CAREFULLY and uncomment with counsciousness
#
class hardened {
# Include minimal or general base settings.
    include minimal
#   include general

# Iptables enabled. CONFIGURE them!
    include iptables
# Some sysctl tuning & hardening
    include sysctl::hardened

# Some uncomfortable eal4 oriented hardenings.
# OLD stuff. TODO: Fix and update
#    include hardening::eal4
#    include users::example42

# SELINUX management.
# Include selinux::disabled , selinux::permissive or selinux::enforcing
#    include selinux::enforcing

# ROLE SPECIFIC CLASSES ARE INCLUDED HERE
   if ( $role ) { include "role::$role" }

}

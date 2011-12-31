class role_ldap {
#    $openldap_support_solaris_clients="yes"
    $openldap_base_dn="dc=example42,dc=com"
    $openldap_multimaster="yes"
#    $openldap_use_ssl="yes"
    include openldap


}

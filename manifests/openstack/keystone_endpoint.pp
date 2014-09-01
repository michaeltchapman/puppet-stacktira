# == Type: keystone_endpoint
#
# Includes the keystone endpoint class
# for the specified service
#
define stacktira::openstack::keystone_endpoint() {

  include "::${name}::keystone::auth"

}

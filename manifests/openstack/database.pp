# == Type: stacktira::openstack::database
#
# Given a service name and the database type
# includes the database class for that service
#
define stacktira::openstack::database(
  $db_type = 'mysql',
) {
  include "::${name}::db::${db_type}"
}

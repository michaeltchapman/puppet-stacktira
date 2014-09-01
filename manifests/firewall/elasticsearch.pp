# == Class: stacktira::firewall::elasticsearch
#
# Sets firewall rules for elasticsearch
#
# [*source*]
#   (required) Source CIDR to allow connections from
#
# [*internal_source*]
#   (optional) If set, additional source CIDR to allow
#   connections from. Use for internal endpoint.
#   Defaults to undef
#
# [*elasticsearch_port*]
#   (optional) The port to open for glance api
#   Defaults to 9200
#
class stacktira::firewall::elasticsearch(
  $source,
  $internal_source      = undef,
  $elasticsearch_port   = 9200,
)
{
  firewall { '591 elasticsearch accept tcp':
    proto  => 'tcp',
    port   => [$elasticsearch_port],
    action => accept,
    source => $source
  }
  if $internal_source {
    firewall { '591 elasticsearch-internal accept tcp':
      proto  => 'tcp',
      port   => [$elasticsearch_port],
      action => accept,
      source => $internal_source
    }
  }
}

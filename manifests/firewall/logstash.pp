# == Class: openstacklib::firewall::logstash
#
# Sets firewall rules for logstash forwarder input
#
# [*source*]
#   (required) Source CIDR to allow connections from
#
# [*internal_source*]
#   (optional) If set, additional source CIDR to allow
#   connections from. Use for internal endpoint.
#   Defaults to undef
#
# [*logstash_port*]
#   (optional) The port to open for logstash forwarder
#   Defaults to 25000
#
class openstacklib::firewall::logstash(
  $source,
  $internal_source      = undef,
  $logstash_port   = 25000,
)
{
  firewall { '591 logstash accept tcp':
    proto  => 'tcp',
    port   => [$logstash_port],
    action => accept,
    source => $source
  }
  if $internal_source {
    firewall { '591 logstash-internal accept tcp':
      proto  => 'tcp',
      port   => [$logstash_port],
      action => accept,
      source => $internal_source
    }
  }
}

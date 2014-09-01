# == Class: stacktira::loadbalance::haproxy::elasticsearch
#
# Provides load balancing for elasticsearch
#
# === Parameters:
#
# [*vip*]
#   (required) The virtual IP
#
# [*cluster_addresses*]
#   (required) List of IPs in the cluster
#   on the interface that provides this service.
#
# [*cluster_names*]
#   (required) List of names of control servers
#
# [*elasticsearch_port*]
#   (optional) The port to load balance for elasticsearch
#   Defaults to 9200
#
# [*listen_options*]
#   (optional) Options to pass to the listen
#   section of haproxy. See haproxy module for
#   additional details.
#   Defaults to undef
#
# [*listen_mode*]
#   (optional) The listen mode to be configured in
#   haproxy for this service
#   Defaults to 'http'
#
# [*balancer_options*]
#   (optional) Options to pass to the balancer
#   in haproxy. See haproxy module for more details.
#   Defaults to undef
#
# [*balancer_cookie*]
#   (optional) A cookie to set in the
#   balancer member in haproxy.
#   Defaults to undef
#
# [*bind_options*]
#   (optional) Array of options to add to the bind line in
#   listen section
#   Defaults to undef
#
class stacktira::loadbalance::haproxy::elasticsearch(
  $vip,
  $cluster_addresses,
  $cluster_names,
  $elasticsearch_port = '9200',
  $listen_options     = undef,
  $listen_mode        = 'http',
  $balancer_options   = undef,
  $balancer_cookie    = undef,
  $bind_options       = undef,
)
{
  if $elasticsearch_port {
    stacktira::loadbalance::haproxy_service { 'elasticsearch':
      vip               => $vip,
      balancer_ports    => $elasticsearch_port,
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options
    }
  }
}

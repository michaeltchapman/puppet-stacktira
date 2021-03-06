# == Class: stacktira::loadbalance::haproxy::glance
#
# Provides load balancing for glance
#
# === Parameters:
#
# [*vip*]
#   (required) The virtual IP for public endpoints
#
# [*cluster_addresses*]
#   (required) List of IPs in the control cluster
#   on the interface that provides this service.
#   For API endpoints this is generally the public
#   address.
#
# [*cluster_names*]
#   (required) List of names of control servers
#
# [*internal_vip*]
#   (optional) The virtual IP for internal endpoints
#   Defaults to undef
#
# [*glance_port*]
#   (optional) The port to load balance for glance api
#   Defaults to 9191
#
# [*registry_port*]
#   (optional) The port to load balance for glance registry
#   Defaults to 9292
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
# [*int_bind_options*]
#   (optional) Array of options to add to the bind line in
#   listen section for internal comms
#   Defaults to undef
#
class stacktira::loadbalance::haproxy::glance(
  $vip,
  $cluster_addresses,
  $cluster_names,
  $internal_vip       = undef,
  $glance_port        = '9292',
  $registry_port      = '9191',
  $listen_options     = undef,
  $listen_mode        = 'http',
  $balancer_options   = undef,
  $balancer_cookie    = undef,
  $bind_options       = undef,
  $int_bind_options   = undef,
)
{
  if $glance_port {
    stacktira::loadbalance::haproxy_service { 'glance-api':
      vip               => $vip,
      balancer_ports    => $glance_port,
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options
    }
  }

  if $registry_port {
    stacktira::loadbalance::haproxy_service { 'glance-registry':
      vip               => $vip,
      balancer_ports    => $registry_port,
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options
    }
  }

  if $internal_vip {
    if $glance_port {
      stacktira::loadbalance::haproxy_service { 'glance-api-internal':
        vip               => $internal_vip,
        balancer_ports    => $glance_port,
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options
      }
    }

    if $registry_port {
      stacktira::loadbalance::haproxy_service { 'glance-registry-internal':
        vip               => $internal_vip,
        balancer_ports    => $registry_port,
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options
      }
    }
  }
}

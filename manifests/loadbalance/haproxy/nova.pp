# == Class: stacktira::loadbalance::haproxy::nova
#
# Provides load balancing for nova
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
# [*nova_port*]
#   (optional) The port to load balance for nova api
#   Defaults to '8774'
#
# [*ec2_port*]
#   (optional) The port to load balance for ec2 api
#   Defaults to '8773'
#
# [*vncproxy_port*]
#   (optional) The port to load balance for vncproxy
#   Defaults to '6080'
#
# [*metadata_port*]
#   (optional) The port to load balance for nova metadata
#   Defaults to '8775'
#
# [*objectstore_port*]
#   (optional) The port to load balance for objectstore
#   Defaults to '3333'
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
#   listen section for public comms
#   Defaults to undef
#
# [*int_bind_options*]
#   (optional) Array of options to add to the bind line in
#   listen section for internal comms
#   Defaults to undef
#
class stacktira::loadbalance::haproxy::nova
(
  $vip,
  $cluster_addresses,
  $cluster_names,
  $internal_vip       = undef,
  $nova_port          = '8774',
  $ec2_port           = '8773',
  $vncproxy_port      = '6080',
  $metadata_port      = '8775',
  $objectstore_port   = '3333',
  $listen_options     = undef,
  $listen_mode        = 'http',
  $balancer_options   = undef,
  $balancer_cookie    = undef,
  $bind_options       = undef,
  $int_bind_options   = undef,
)
{

  if $nova_port {
    stacktira::loadbalance::haproxy_service { 'nova-api':
      vip               => $vip,
      balancer_ports    => [$nova_port],
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options,
    }
  }

  if $ec2_port {
    stacktira::loadbalance::haproxy_service { 'nova-ec2':
      vip               => $vip,
      balancer_ports    => [$ec2_port],
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options,
    }
  }

  if $vncproxy_port {
    stacktira::loadbalance::haproxy_service { 'nova-novnc':
      vip               => $vip,
      balancer_ports    => [$vncproxy_port],
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options,
    }
  }

  if $metadata_port {
    stacktira::loadbalance::haproxy_service { 'nova-metadata':
      vip               => $vip,
      balancer_ports    => [$metadata_port],
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options,
    }
  }

  if $objectstore_port {
    stacktira::loadbalance::haproxy_service { 'nova-objectstore':
      vip               => $vip,
      balancer_ports    => [$objectstore_port],
      listen_options    => $listen_options,
      listen_mode       => $listen_mode,
      balancer_options  => $balancer_options,
      balancer_cookie   => $balancer_cookie,
      cluster_addresses => $cluster_addresses,
      cluster_names     => $cluster_names,
      bind_options      => $bind_options,
    }
  }

  if $internal_vip {
    if $nova_port {
      stacktira::loadbalance::haproxy_service { 'nova-api-internal':
        vip               => $internal_vip,
        balancer_ports    => [$nova_port],
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options,
      }
    }

    if $ec2_port {
      stacktira::loadbalance::haproxy_service { 'nova-ec2-internal':
        vip               => $internal_vip,
        balancer_ports    => [$ec2_port],
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options,
      }
    }

    if $vncproxy_port {
      stacktira::loadbalance::haproxy_service { 'nova-novnc-internal':
        vip               => $internal_vip,
        balancer_ports    => [$vncproxy_port],
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options,
      }
    }

    if $metadata_port {
      stacktira::loadbalance::haproxy_service { 'nova-metadata-internal':
        vip               => $internal_vip,
        balancer_ports    => [$metadata_port],
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options,
      }
    }

    if $objectstore_port {
      stacktira::loadbalance::haproxy_service { 'nova-objectstore-internal':
        vip               => $internal_vip,
        balancer_ports    => [$objectstore_port],
        listen_options    => $listen_options,
        listen_mode       => $listen_mode,
        balancer_options  => $balancer_options,
        balancer_cookie   => $balancer_cookie,
        cluster_addresses => $cluster_addresses,
        cluster_names     => $cluster_names,
        bind_options      => $int_bind_options,
      }
    }
  }
}

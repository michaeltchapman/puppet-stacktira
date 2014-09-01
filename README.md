puppet-stacktira
================

[![Build Status](https://travis-ci.org/michaeltchapman/puppet-stacktira.png?branch=master)](https://travis-ci.org/michaeltchapman/puppet-stacktira)

puppet-openstack helper manifests

This repo contains manifests needed to use the puppet_openstack_builder data model with the aptira scenario.

## Load Balancing

Load balancing is currently done by haproxy, with a VIP maintained by keepalived.

### stacktira::loadbalance::haproxy

Sets the haproxy defaults and creates public and internal VIPs

### stacktira::loadbalance::haproxy::%{service_name}

Sets load balancing endpoints for each of the ports used by a particular service on its standard VIP, and for public APIs optionally on the internal VIP as well.

Available services: Ceilometer, Cinder, Dashboard, Glance, Heat, Keystone, MySQL, Neutron, Nova, RabbitMQ.

## Firewall Management

### stacktira::firewall

Sets dependency order so that firewall rules are applied before any services come up.

### stacktira::firewall::%{service_name}

Sets firewall rules for each of the ports used by a particular service on its standard interface, and for public APIs, optionally on the internal VIP as well.

Available services: Ceilometer, Cinder, Dashboard, Edeploy, Glance, Heat, Keepalived, Keystone, MySQL, Neutron, Nova, Puppet, RabbitMQ.

## Puppet Master

### stacktira::puppet::master

Creates a puppet master with puppetdb, passenger and apache.

## Control Hosts Knowledge

### stacktira::hosts

Creates hosts entries for all control nodes, the build node, and for the fqdn of each node so that the fqdn fact works.

## Repo Management

### stacktira::repo

Imports repos from the openstack module for cloud packages, and sets yum or apt proxies.

## Version compatibility

### stacktira::compat

Contains minor fixes that allows puppet modules on version n to deploy version n-1

## Openstack

### stacktira::openstack::endpoints

Includes the keystone endpoint classes for services in the listed array

### stacktira::openstack::databases

Includes the database classes for services in the listed array

# Related Modules

This module has taken significant pieces of work and/or inspiration from the following repos:
 - CiscoSystems/puppet-coi
 - CiscoSystems/puppet-coe
 - CiscoSystems/puppet-openstack-ha
 - CiscoSystems/puppet-openstack

# Authors

 - Michael Chapman

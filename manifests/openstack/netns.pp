# == Class: stacktira::openstack::netns
#
# This class ensures network namespace tools
# are installed. Mostly taken shamelessly from
# packstack (github.com/stackforge/packstack)
#
class stacktira::openstack::netns() {
  if $::netns_support != 'true' {
    package { ['kernel', 'iputils', 'iproute']:
      ensure => 'latest'
    }
  }
}

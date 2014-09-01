# == Class: stacktira::firewall
#
# This class does nothing other than
# ensuring all firewall rules are applied
# before services are managed.
#
class stacktira::firewall {
    Firewall <||> -> Service <||>
}

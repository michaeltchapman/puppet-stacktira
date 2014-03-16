require 'rake'
require 'puppetlabs_spec_helper/rake_tasks'

require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send('disable_names_containing_dash')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_class_parameter_defaults')
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp", "spec/**/*.pp"]

task :default => [:spec_prep, :spec_standalone, :lint]
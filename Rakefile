require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rspec'
require 'rspec/core'
require 'rspec/mocks'
require 'rspec/expectations'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
  t.rspec_opts ||= []
  t.rspec_opts << '--color'
  t.rspec_opts << '-f documentation'
end

task :default => :spec
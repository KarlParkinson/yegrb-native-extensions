require "bundler/gem_tasks"
require "rake/extensiontask"
task :default => :spec
Rake::ExtensionTask.new("super") do |ext|
  ext.lib_dir = "lib/super"
end


lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "super/version"

Gem::Specification.new do |spec|
  spec.name          = "super"
  spec.version       = Super::VERSION
  spec.authors       = ["Karl Parkinson"]
  spec.email         = ["tom@mailinator.com"]

  spec.summary       = "A gem"
  spec.description   = "Describe"
  spec.homepage      = "https://github.com/KarlParkinson/yegrb-native-extensions"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/KarlParkinson/yegrb-native-extensions"
    spec.metadata["changelog_uri"] = "https://github.com/KarlParkinson/yegrb-native-extensions"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir["{app,config,db,lib,ext}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions << "ext/super/extconf.rb"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
end

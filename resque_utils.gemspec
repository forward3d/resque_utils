# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resque_utils/version"

Gem::Specification.new do |s|
  s.name        = "resque_utils"
  s.version     = ResqueUtils::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lloyd Pick"]
  s.email       = ["lloyd.pick@forward.co.uk"]
  s.homepage    = ""
  s.summary     = %q{Provides some extra cap commands for Resque}
  s.description = %q{Provides extra help cap commands for use with Resque, requeuing jobs, mass deleting jobs}

  s.rubyforge_project = "resque_utils"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

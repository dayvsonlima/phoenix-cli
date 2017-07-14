# encoding: utf-8
require File.expand_path("../lib/phoenix-cli/version", __FILE__)

Gem::Specification.new do |s|
    s.name = "phoenix-cli"
    s.version = PhoenixCli::VERSION
    s.authors = ["Dayvson Lima"]
    s.email = ["dayvsonlima31@gmail.com"]
    s.homepage = "https://github.com/dayvsonlima/phoenix-cli"
    s.summary = %q{Phoenix frienfly CLI write in ruby}
    s.description = %q{Phoenix Pretty CLI for using phoenix command line friendly}
    s.licenses = ['MIT']

    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ['lib']

    s.add_runtime_dependency 'thor', '~> 0.19'
    s.add_development_dependency 'rspec', '~> 3'
end

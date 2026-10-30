# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = "defi"
  spec.version                = File.read(File.join(__dir__, "VERSION.semver")).chomp
  spec.author                 = "Cyril Kato"
  spec.email                  = "contact@cyril.email"
  spec.summary                = "A method call prepared in advance, to send to any object"
  spec.description            = "Prepares a method call, a name with its arguments, and sends it to any object, " \
                                "keeping what came back: the value returned, or the exception raised."
  spec.homepage               = "https://fixrb.dev/gems/defi/"
  spec.license                = "MIT"
  spec.files                  = Dir["LICENSE.md", "README.md", "lib/**/*.rb", base: __dir__]
  spec.required_ruby_version  = ">= 3.3.0"

  spec.metadata["bug_tracker_uri"]       = "https://github.com/fixrb/defi/issues"
  spec.metadata["changelog_uri"]         = "https://github.com/fixrb/defi#changes-in-401"
  spec.metadata["documentation_uri"]     = "https://rubydoc.info/gems/defi"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"]       = "https://github.com/fixrb/defi"
end

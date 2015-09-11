require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'defi'
require 'spectus'

Spectus.this { Defi.send(:abs).to(-42) }.MUST(Equal: 42)
Spectus.this { Defi.send(:*, 7).to(6) }.MUST(Equal: 42)
Spectus.this { Defi.send(:BOOM).to(:foo) }.MUST(RaiseException: NoMethodError)

require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'defi'
require 'spectus'

Spectus.this { Defi.on(:abs).to(-42).object }.MUST(Equal: 42)
Spectus.this { Defi.on(:abs).to(-42).valid? }.MUST(:BeTrue)

Spectus.this { Defi.on(:BOOM).to(:foo).object.class }.MUST(Equal: NoMethodError)
Spectus.this { Defi.on(:BOOM).to(:foo).valid? }.MUST(:BeFalse)

require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'defi'
require 'spectus'

d1 = Defi.send(:abs)
Spectus.this { d1.to(-42)  }.MUST(Equal: 42)
Spectus.this { d1.to_h     }.MUST(Eql: { method: :abs, args: [] })

d2 = Defi.send(:*, 7)
Spectus.this { d2.to(6) }.MUST(Equal: 42)
Spectus.this { d2.to_h  }.MUST(Eql: { method: :*, args: [7] })

d3 = Defi.send(:BOOM)
Spectus.this { d3.to(:foo)  }.MUST(RaiseException: NoMethodError)
Spectus.this { d3.to_h      }.MUST(Eql: { method: :BOOM, args: [] })

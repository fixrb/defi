require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'defi'
require 'spectus'

include Spectus

d1 = Defi.send(:abs)
it { d1.to(-42)  }.MUST equal 42
it { d1.to_h     }.MUST eql(method: :abs, args: [])

d2 = Defi.send(:*, 7)
it { d2.to(6) }.MUST equal 42
it { d2.to_h  }.MUST eql(method: :*, args: [7])

d3 = Defi.send(:BOOM)
it { d3.to(:foo)  }.MUST raise_exception NoMethodError
it { d3.to_h      }.MUST eql(method: :BOOM, args: [])

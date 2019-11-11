# frozen_string_literal: true

require_relative 'test'

class Test2 < Test
  def run!
    raise unless challenge.to_s     == '.*(7)'
    raise unless challenge.inspect  == 'Defi(method: :*, args: [7], opts: {}, block: )'
    raise unless challenge.to(6)    == 42
    raise unless challenge.to_h     == { method: :*, args: [7], opts: {}, block: nil }
  end
end

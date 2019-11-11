# frozen_string_literal: true

require_relative 'test'

class Test1 < Test
  def run!
    raise unless challenge.to_s     == '.abs'
    raise unless challenge.inspect  == 'Defi(method: :abs, args: [], opts: {}, block: )'
    raise unless challenge.to(-42)  == 42
    raise unless challenge.to_h     == { method: :abs, args: [], opts: {}, block: nil }
  end
end

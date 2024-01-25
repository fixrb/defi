# frozen_string_literal: true

require_relative "test"

class Test1 < Test
  def run!
    raise unless challenge.to_s         == ".abs"
    raise unless challenge.inspect      == "Defi(name: :abs, args: [], opts: {}, block: nil)"
    raise unless challenge.to(-42).call == 42
    raise unless challenge.to_h         == { name: :abs, args: [], opts: {}, block: nil }
  end
end

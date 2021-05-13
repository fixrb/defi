# frozen_string_literal: true

require_relative "test"

class Test3 < Test
  def run!
    raise unless challenge.to_s     == ".BOOM"
    raise unless challenge.inspect  == "Defi(method: :BOOM, args: [], opts: {}, block: nil)"
    raise unless challenge.to_h     == { method: :BOOM, args: [], opts: {}, block: nil }

    challenge.to(:foo).call
    raise
  rescue NoMethodError => e
    e
  end
end

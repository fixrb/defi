# frozen_string_literal: true

require_relative "test"

class Test6 < Test
  def run!(object)
    raise unless challenge.to_s             == '.gsub!("world", "Alice")'
    raise unless challenge.inspect          == 'Defi(method: :gsub!, args: ["world", "Alice"], opts: {}, block: nil)'
    raise unless challenge.to!(object).call == "hello Alice"
    raise unless challenge.to_h             == { method: :gsub!, args: %w[world Alice], opts: {}, block: nil }
  end
end

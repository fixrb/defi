# frozen_string_literal: true

require_relative "test"

class Test4 < Test
  def run!
    raise unless challenge.to_s == '.encode("Windows-1252", :invalid=>:replace, :undef=>:replace)'

    unless challenge.inspect == 'Defi(method: :encode, args: ["Windows-1252"], opts: {:invalid=>:replace, :undef=>:replace}, block: nil)'
      raise
    end

    raise unless challenge.to("hi∑").call == "hi?"
    raise unless challenge.to_h           == { method: :encode, args: ["Windows-1252"],
opts: { invalid: :replace, undef: :replace }, block: nil }
  end
end

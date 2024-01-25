# frozen_string_literal: true

require_relative "test"

class Test5 < Test
  def run!(mocked_proc:)
    raise unless challenge.to_s == ".fetch(:missing_key, <Proc>)"
    raise unless challenge.inspect == "Defi(name: :fetch, args: [:missing_key], opts: {}, block: <Proc>)"
    raise unless challenge.to(present_key: 88).call == 42
    raise unless challenge.to_h                     == { name: :fetch, args: [:missing_key], opts: {},
block: mocked_proc }
  end
end

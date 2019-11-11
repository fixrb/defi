# frozen_string_literal: true

require_relative 'test'

class Test2 < Test
  def run!
    it { challenge.to_s     }.MUST eql '.*(7)'
    it { challenge.inspect  }.MUST eql 'Defi(method: :*, args: [7], opts: {}, block: )'
    it { challenge.to(6)    }.MUST equal 42
    it { challenge.to_h     }.MUST eql(method: :*, args: [7], opts: {}, block: nil)
  end
end

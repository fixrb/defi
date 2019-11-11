# frozen_string_literal: true

require_relative 'test'

class Test1 < Test
  def run!
    it { challenge.to_s     }.MUST eql '.abs'
    it { challenge.inspect  }.MUST eql 'Defi(method: :abs, args: [], opts: {}, block: )'
    it { challenge.to(-42)  }.MUST equal 42
    it { challenge.to_h     }.MUST eql(method: :abs, args: [], opts: {}, block: nil)
  end
end

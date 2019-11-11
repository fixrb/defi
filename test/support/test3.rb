# frozen_string_literal: true

require_relative 'test'

class Test3 < Test
  def run!
    it { challenge.to_s     }.MUST eql '.BOOM'
    it { challenge.inspect  }.MUST eql 'Defi(method: :BOOM, args: [], opts: {}, block: )'
    it { challenge.to(:foo) }.MUST raise_exception NoMethodError
    it { challenge.to_h     }.MUST eql(method: :BOOM, args: [], opts: {}, block: nil)
  end
end

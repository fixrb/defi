# frozen_string_literal: true

require_relative 'test'

class Test3 < Test
  def run!
    it { subject.to_s     }.MUST eql '.BOOM'
    it { subject.inspect  }.MUST eql 'Defi(method: :BOOM, args: [], opts: {}, block: )'
    it { subject.to(:foo) }.MUST raise_exception NoMethodError
    it { subject.to_h     }.MUST eql(method: :BOOM, args: [], opts: {}, block: nil)
  end
end

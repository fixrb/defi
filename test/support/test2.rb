# frozen_string_literal: true

require_relative 'test'

class Test2 < Test
  def run!
    it { subject.to_s     }.MUST eql '.*(7)'
    it { subject.inspect  }.MUST eql 'Defi(method: :*, args: [7], opts: {}, block: )'
    it { subject.to(6)    }.MUST equal 42
    it { subject.to_h     }.MUST eql(method: :*, args: [7], opts: {}, block: nil)
  end
end

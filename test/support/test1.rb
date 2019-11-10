# frozen_string_literal: true

require_relative 'test'

class Test1 < Test
  def run!
    it { subject.to_s     }.MUST eql '.abs'
    it { subject.inspect  }.MUST eql 'Defi(method: :abs, args: [], opts: {}, block: )'
    it { subject.to(-42)  }.MUST equal 42
    it { subject.to_h     }.MUST eql(method: :abs, args: [], opts: {}, block: nil)
  end
end

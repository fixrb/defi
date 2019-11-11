# frozen_string_literal: true

require_relative 'test'

class Test6 < Test
  def run!(object)
    it { challenge.to_s                 }.MUST eql '.gsub!("world", "Alice")'
    it { challenge.inspect              }.MUST eql 'Defi(method: :gsub!, args: ["world", "Alice"], opts: {}, block: )'
    it { challenge.to!(object)          }.MUST eql 'hello Alice'
    it { challenge.to_h                 }.MUST eql(method: :gsub!, args: ["world", "Alice"], opts: {}, block: nil)
  end
end

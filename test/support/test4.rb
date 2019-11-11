# frozen_string_literal: true

require_relative 'test'

class Test4 < Test
  def run!
    it { challenge.to_s       }.MUST eql '.encode("Windows-1252", :invalid=>:replace, :undef=>:replace)'
    it { challenge.inspect    }.MUST eql 'Defi(method: :encode, args: ["Windows-1252"], opts: {:invalid=>:replace, :undef=>:replace}, block: )'
    it { challenge.to('hi∑')  }.MUST eql 'hi?'
    it { challenge.to_h       }.MUST eql(method: :encode, args: ['Windows-1252'], opts: { invalid: :replace, undef: :replace }, block: nil)
  end
end

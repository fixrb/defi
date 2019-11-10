# frozen_string_literal: true

require_relative 'test'

class Test4 < Test
  def run!
    it { subject.to_s       }.MUST eql '.encode("Windows-1252", :invalid=>:replace, :undef=>:replace)'
    it { subject.inspect    }.MUST eql 'Defi(method: :encode, args: ["Windows-1252"], opts: {:invalid=>:replace, :undef=>:replace}, block: )'
    it { subject.to('hi∑')  }.MUST eql 'hi?'
    it { subject.to_h       }.MUST eql(method: :encode, args: ['Windows-1252'], opts: { invalid: :replace, undef: :replace }, block: nil)
  end
end

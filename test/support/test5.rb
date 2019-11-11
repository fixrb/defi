# frozen_string_literal: true

require_relative 'test'

class Test5 < Test
  def run!(mocked_proc:)
    it { challenge.to_s                 }.MUST eql '.fetch(:missing_key, <Proc>)'
    it { challenge.inspect              }.MUST eql 'Defi(method: :fetch, args: [:missing_key], opts: {}, block: <Proc>)'
    it { challenge.to(present_key: 88)  }.MUST equal 42
    it { challenge.to_h                 }.MUST eql(method: :fetch, args: [:missing_key], opts: {}, block: mocked_proc)
  end
end

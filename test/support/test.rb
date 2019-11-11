# frozen_string_literal: true

class Test
  attr_reader :challenge

  def initialize
    @challenge = yield
  end
end

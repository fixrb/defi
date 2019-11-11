# frozen_string_literal: true

require 'spectus'

class Test
  include Spectus

  attr_reader :challenge

  def initialize
    @challenge = yield
  end
end

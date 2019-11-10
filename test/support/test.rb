# frozen_string_literal: true

require 'spectus'

class Test
  include Spectus

  attr_reader :subject

  def initialize
    @subject = yield
  end
end

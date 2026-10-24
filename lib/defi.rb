# frozen_string_literal: true

# Prepares a method call, a name with its arguments, and sends it to any
# object, keeping what came back: the value returned, or the exception
# raised.
#
# @example
#   challenge = Defi::Challenge.new(:+, 2)
#   challenge.to(40).object # => 42
#   challenge.to("a").call  # raises TypeError: no implicit conversion of Integer into String
module Defi
end

require_relative "defi/challenge"
require_relative "defi/value"

# frozen_string_literal: true

# Namespace for the Defi library.
#
# Defi provides a flexible way to specify method calls with arguments
# for later execution. It supports method chaining, exception handling,
# and value inspection.
#
# @example Basic arithmetic operation
#   addition = Defi(:+, 2)
#   addition.to(1).call # => 3
#
# @example String manipulation
#   upcase = Defi(:upcase)
#   upcase.to("hello").call # => "HELLO"
#
# @example Method with keyword arguments
#   format = Defi(:format, precision: 2)
#   format.to(3.14159).call # => "3.14"
#
# @example Block usage
#   map_double = Defi(:map) { |x| x * 2 }
#   map_double.to([1, 2, 3]).call # => [2, 4, 6]
#
# @example Error handling
#   result = Defi(:undefined_method).to(42)
#   result.raised? # => true
#   result.object # => #<NoMethodError: ...>
#
module Defi
end

# Load core components
require_relative "kernel"

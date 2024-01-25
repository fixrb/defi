# frozen_string_literal: true

# Namespace for the Defi library.
#
# This file serves as the entry point for the Defi library, establishing the
# Defi namespace and requiring necessary components.  It is typically required
# at the beginning of using the Defi library in an application.
#
# @example Requiring the Defi library in a Ruby application
#   require "defi"
#
# @example Adding 2 to 1
#   # Create a Defi method object for addition with an argument of 2
#   addition = Defi(:+, 2)
#   addition.inspect # => "Defi(name: :+, args: [2], opts: {}, block: nil)"
#
#   # Apply the addition to the number 1
#   result = addition.to(1)
#   result # => Value(object: 3, raised: false)
#
#   # Execute the addition and get the result
#   result.call # => 3
#
module Defi
end

# Require additional components of the Defi library.
require_relative "kernel"

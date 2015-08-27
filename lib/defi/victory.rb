require_relative 'result'

module Defi
  # Returned when a challenge is won.
  #
  # @api private
  #
  class Victory < Result
    # The state of the result.
    #
    # @api private
    #
    # @return [Boolean] The value of the state.
    def valid?
      true
    end
  end
end

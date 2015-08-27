require_relative 'result'

module Defi
  # Returned when a challenge is lost.
  #
  # @api private
  #
  class Defeat < Result
    # The state of the result.
    #
    # @api private
    #
    # @return [Boolean] The value of the state.
    def valid?
      false
    end
  end
end

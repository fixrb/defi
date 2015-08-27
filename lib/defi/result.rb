module Defi
  # Returned when a challenge is done.
  #
  # @api private
  #
  class Result
    # Initialize the abstract class.
    #
    # @api private
    #
    # @param object [BasicObject] The result.
    def initialize(object)
      @object = object
    end
    #
    # @api public
    #
    # @!attribute [r] object
    #
    # @return [BasicObject] The result.
    attr_reader :object
  end
end

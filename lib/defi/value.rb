# frozen_string_literal: true

module Defi
  # This class contains an object that returned or raised during the initialize.
  #
  class Value
    # @return [#object_id] The returned or the raised object.
    attr_reader :object

    # Initialize the value class.
    #
    # @yieldreturn [#object_id] The challenged code.
    # rubocop:disable Lint/RescueException
    def initialize
      @object = yield
      @raised = false
    rescue ::Exception => e
      @object = e
      @raised = true
    end
    # rubocop:enable Lint/RescueException

    # Raise or return the value.
    #
    # @return [#object_id] Raised exception or returned object.
    def call
      raise object if raised?

      object
    end

    # @return [Boolean] The value was raised (or returned)?
    def raised?
      @raised
    end

    # Properties of the value.
    #
    # @return [Hash] The properties of the value.
    def to_h
      {
        raised: raised?,
        object: object
      }
    end

    # String of the value.
    #
    # @return [String] The string representation of the value.
    def to_s
      string = raised? ? 'raise' : 'return'
      "#{string} #{object}"
    end

    # A string containing a human-readable representation of the value.
    #
    # @return [String] The human-readable representation of the value.
    def inspect
      "Value(object: #{object}, raised: #{raised?})"
    end
  end
end

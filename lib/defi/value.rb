# frozen_string_literal: true

module Defi
  # Represents a result of an operation, encapsulating either the returned value
  # or an exception raised during the execution.
  #
  # This class is used to handle the outcome of a method invocation, allowing
  # to distinguish between successful results and exceptions.
  class Value
    RAISE = "raise"
    RETURN = "return"

    # @return [#object_id] The returned or the raised object.
    attr_reader :object

    # Initializes a Value object with the result of the provided block.
    # Captures any exception raised during the block execution.
    #
    # @example
    #   value = Defi::Value.new { 1 + 1 }
    #   value.call # => 2
    #
    # @example Handling an exception
    #   value = Defi::Value.new { raise 'Error' }
    #   value.call # raises 'Error'
    #
    # @yieldreturn [#object_id] The result of the block or the exception raised.
    # rubocop:disable Lint/RescueException
    def initialize
      @object = yield
      @raised = false
    rescue ::Exception => e
      @object = e
      @raised = true
    end
    # rubocop:enable Lint/RescueException

    # Returns the object if no exception was raised, otherwise raises the exception.
    #
    # @example
    #   value = Defi::Value.new { "Hello" }
    #   value.call # => "Hello"
    #
    # @return [#object_id] The returned object or raises the captured exception.
    def call
      raise object if raised?

      object
    end

    # Checks if an exception was raised during the execution.
    #
    # @example
    #   value = Defi::Value.new { raise 'Error' }
    #   value.raised? # => true
    #
    # @return [Boolean] True if an exception was raised, otherwise false.
    def raised?
      @raised
    end

    # Returns a hash containing the properties of the Value object.
    #
    # @return [Hash] The properties of the Value object.
    def to_h
      {
        raised: raised?,
        object:
      }
    end

    # Returns a string representation of the Value object.
    #
    # @return [String] The string representation of the Value object.
    def to_s
      "#{raise_or_return} #{object}"
    end

    # Returns a human-readable representation of the Value object.
    #
    # @return [String] The human-readable representation of the Value object.
    def inspect
      "Value(object: #{object}, raised: #{raised?})"
    end

    private

    # Returns a string indicating whether the object was raised or returned.
    #
    # @return [String] A "raise" or "return" string.
    def raise_or_return
      raised? ? RAISE : RETURN
    end
  end
end

# frozen_string_literal: true

module Defi
  # This class contains an object that returned or raised during the initialize.
  #
  # @api private
  #
  class Value
    # @return [#object_id] The returned or the raised object.
    attr_reader :object

    # Initialize the value class.
    #
    # @api public
    #
    # @param block [Proc] The block of code to execute.
    def initialize(&block)
      @object = block.call
      @raised = false
    rescue ::Exception => e
      @object = e
      @raised = true
    end

    # Raise or return the value.
    #
    # @return [BasicObject, Exception] Raised exception or returned object.
    def call
      raise object if raised?

      object
    end

    # @api public
    #
    # @return [Boolean] The value was raised (or returned)?
    def raised?
      @raised
    end

    # Properties of the value.
    #
    # @api public
    #
    # @return [Hash] The properties of the value.
    def to_h
      {
        raised: raised?,
        object: @object
      }
    end

    # String of the value.
    #
    # @api public
    #
    # @return [String] The string representation of the value.
    def to_s
      string = if raised?
                 'raise'
               else
                 'return'
               end

      "#{string} #{@object}"
    end

    # A string containing a human-readable representation of the value.
    #
    # @api public
    #
    # @return [String] The human-readable representation of the value.
    def inspect
      "Value(object: #{@object}, raised: #{raised?})"
    end
  end
end

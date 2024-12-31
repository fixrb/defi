# frozen_string_literal: true

module Defi
  # Represents a result of an operation, encapsulating both successful returns
  # and exceptions. This class intentionally catches all exceptions (Exception)
  # instead of StandardError to maintain complete control over method execution
  # outcomes, particularly in testing contexts. This ensures that system-level
  # exceptions like SystemExit cannot prematurely terminate test execution with
  # potentially false positive results.
  class Value
    RAISE = "raise"
    RETURN = "return"

    # @return [#object_id] The returned value or caught exception
    attr_reader :object

    # Initializes a Value object by executing the provided block.
    #
    # @example Successful execution
    #   value = Defi::Value.new { 1 + 1 }
    #   value.call # => 2
    #   value.raised? # => false
    #
    # @example Exception handling
    #   value = Defi::Value.new { raise TypeError, "Invalid type" }
    #   value.raised? # => true
    #   value.object # => #<TypeError: Invalid type>
    #
    # @note This implementation catches Exception instead of StandardError
    #   to provide complete control over method execution outcomes,
    #   including system-level exceptions when needed.
    #
    # @yieldreturn [#object_id] Result or exception from block execution
    def initialize
      @object = yield
      @raised = false
    rescue ::Exception => e # rubocop:disable Lint/RescueException
      @object = e
      @raised = true
    end

    # Returns the result or raises the captured exception.
    #
    # @example With successful result
    #   Value.new { "success" }.call # => "success"
    #
    # @example With exception
    #   Value.new { raise "error" }.call # raises RuntimeError: error
    #
    # @return [#object_id] The operation result
    # @raise [Exception] The captured exception if raised? is true
    def call
      raise object if raised?

      object
    end

    # @return [Boolean] true if execution raised an exception
    def raised?
      @raised
    end

    # @return [String] Human-readable representation
    def inspect
      "Value(object: #{object}, raised: #{raised?})"
    end

    # @return [Hash] Value properties
    def to_h
      { raised: raised?, object: }
    end

    # @return [String] String representation showing outcome type and value
    def to_s
      "#{raise_or_return} #{object}"
    end

    private

    # @return [String] Execution outcome type
    def raise_or_return
      raised? ? RAISE : RETURN
    end
  end
end

# frozen_string_literal: true

module Defi
  # What came back from a challenge: the object returned, or the exception
  # raised. A value is frozen.
  class Value
    # The exceptions a method raises on its own, which a challenge keeps as
    # its value. Anything else, an interruption or a signal, a shortage of
    # memory, the end of a `Timeout`, goes through.
    RAISED = [::StandardError, ::ScriptError, ::SystemStackError, ::SystemExit].freeze

    # @return [Object] the object returned, or the exception raised
    attr_reader :object

    # @param object [Object] the object returned, or the exception raised
    # @param raised [Boolean] whether the method raised: `true` or `false`,
    #   as given
    def initialize(object, raised)
      @object = object
      @raised = raised
      freeze
    end

    # @return [Boolean] whether the method raised
    def raised?
      @raised
    end

    # @return [Object] the object returned
    # @raise [Exception] the exception raised, again, with its own cause
    def call
      raise object, cause: ::Exception.instance_method(:cause).bind_call(object) if raised?

      object
    end
  end
end

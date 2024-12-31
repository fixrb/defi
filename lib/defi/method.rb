# frozen_string_literal: true

module Defi
  # Represents a method to be applied against an object.
  # Encapsulates method name, arguments, keyword arguments and blocks
  # for dynamic method invocation with proper error handling.
  class Method < ::BasicObject
    # Initialize a new Method object.
    #
    # @param name [Symbol] The method name
    # @param args [Array] Positional arguments
    # @param opts [Hash] Keyword arguments
    # @param block [Proc] Optional block
    #
    # @raise [ArgumentError] If name is not a Symbol, raises with the actual class received
    def initialize(name, *args, **opts, &block)
      raise ::ArgumentError, "Method name must be a Symbol, got: #{name.class}" unless name.is_a?(::Symbol)

      @name = name
      @args = args
      @opts = opts
      @block = block
    end

    # Applies the method to the given object.
    #
    # @param object [#object_id] Target object for method invocation
    # @return [Defi::Value] Result wrapper containing return value or exception
    #
    # @example Basic arithmetic
    #   Defi::Method.new(:+, 1).to(2).call # => 3
    #
    # @example Block usage
    #   Defi::Method.new(:map) { |x| x * 2 }.to([1, 2, 3]).call # => [2, 4, 6]
    #
    # @example Error handling
    #   result = Defi::Method.new(:undefined).to(42)
    #   result.raised? # => true
    def to(object)
      Value.new { object.public_send(@name, *@args, **@opts, &@block) }
    end

    # @return [Hash] Method properties
    def to_h
      {
        name:  @name,
        args:  @args,
        opts:  @opts,
        block: @block
      }
    end

    # @return [String] Human-readable representation
    #
    # @example
    #   Defi::Method.new(:+, 1).inspect
    #   # => "Defi(name: :+, args: [1], opts: {}, block: nil)"
    def inspect
      "Defi(" \
        "name: #{@name.inspect}, " \
        "args: #{@args.inspect}, " \
        "opts: #{@opts.inspect}, " \
        "block: #{@block.nil? ? "nil" : "<Proc>"})"
    end

    # @return [String] String representation of the method call
    #
    # @example
    #   Defi::Method.new(:+, 1).to_s # => ".+(1)"
    #   Defi::Method.new(:map) { |x| x }.to_s # => ".map(<Proc>)"
    def to_s
      return ".#{@name}" if no_arguments?

      ".#{@name}(#{stringified_arguments})"
    end

    private

    def no_arguments?
      @args.empty? && @opts.empty? && @block.nil?
    end

    def stringified_arguments
      [
        args_string,
        opts_string,
        block_string
      ].compact.join(", ")
    end

    def args_string
      @args.inspect[1..-2] unless @args.empty?
    end

    def opts_string
      @opts.inspect[1..-2] unless @opts.empty?
    end

    def block_string
      "<Proc>" if @block
    end
  end
end

require_relative "value"

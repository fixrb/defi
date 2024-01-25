# frozen_string_literal: true

module Defi
  # Represents a method to be applied against an object.
  # This class encapsulates the method name, its arguments, keyword arguments,
  # and an optional block, enabling dynamic method invocation.
  class Method < ::BasicObject
    # Initialize a new Method object.
    #
    # @param name  [Symbol] The name of the method.
    # @param args  [Array]  Any arguments of the method.
    # @param opts  [Hash]   Any keyword arguments of the method.
    # @param block [Proc]   Any block argument of the method.
    # @raise [ArgumentError] If the name is not a symbol.
    def initialize(name, *args, **opts, &block)
      raise ::ArgumentError, name.class.inspect unless name.is_a?(::Symbol)

      @name = name
      @args = args
      @opts = opts
      @block = block
    end

    # Applies the method to the given object.
    #
    # @example
    #   add = Defi::Method.new(:+, 1)
    #   add.to(2).call # => 3
    #
    # @param object [#object_id] The object to method.
    # @return [Defi::Value] The actual value, to raise or to return.
    def to(object)
      Value.new { object.public_send(@name, *@args, **@opts, &@block) }
    end

    # Returns a hash containing the method's properties.
    #
    # @return [Hash] The properties of the method.
    def to_h
      {
        name:  @name,
        args:  @args,
        opts:  @opts,
        block: @block
      }
    end

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/CyclomaticComplexity

    # Returns a string representation of the method.
    #
    # @example
    #   add = Defi::Method.new(:+, 1)
    #   add.to_s # => ".+(1)"
    #
    # @return [String] The string representation of the method.
    def to_s
      string = ".#{@name}"
      return string if @args.empty? && @opts.empty? && @block.nil?

      stringified_args  = @args.inspect[1..-2]
      stringified_opts  = @opts.inspect[1..-2]
      stringified_block = "<Proc>" unless @block.nil?

      stringified_items = []
      stringified_items << stringified_args   unless @args.empty?
      stringified_items << stringified_opts   unless @opts.empty?
      stringified_items << stringified_block  unless @block.nil?

      "#{string}(#{stringified_items.join(", ")})"
    end

    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/CyclomaticComplexity

    # Returns a human-readable representation of the method.
    #
    # @example
    #   add = Defi::Method.new(:+, 1)
    #   add.inspect # => "Defi(name: :+, args: [1], opts: {}, block: nil)"
    #
    # @return [String] The human-readable representation of the method.
    def inspect
      inspected_name  = @name.inspect
      inspected_args  = @args.inspect
      inspected_opts  = @opts.inspect
      inspected_block = @block.nil? ? "nil" : "<Proc>"

      "Defi(" \
        "name: #{inspected_name}, " \
        "args: #{inspected_args}, " \
        "opts: #{inspected_opts}, " \
        "block: #{inspected_block})"
    end
  end
end

require_relative "value"

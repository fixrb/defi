# frozen_string_literal: true

require_relative "value"

module Defi
  # A method call prepared in advance: a name, positional arguments, keyword
  # arguments and a block, to send to any object with {#to}. A challenge is
  # frozen, and sends its message as `public_send` does: a private method is
  # a `NoMethodError`, while a public one that reaches further, such as
  # `send` or `instance_eval`, does what it does.
  class Challenge
    # @return [Symbol] the name of the method
    attr_reader :name

    # @return [Array] the positional arguments, frozen
    attr_reader :args

    # @return [Hash] the keyword arguments, frozen
    attr_reader :opts

    # @return [Proc, nil] the block
    attr_reader :block

    # @param name [Symbol] the name of the method
    # @param args [Array] the positional arguments
    # @param opts [Hash] the keyword arguments
    # @param block [Proc] the block
    # @raise [ArgumentError] when the name is not a Symbol
    def initialize(name, *args, **opts, &block)
      raise ::ArgumentError, "the name of the method must be a Symbol" unless name.instance_of?(::Symbol)

      @name = name
      @args = args.freeze
      @opts = opts.freeze
      @block = block
      freeze
    end

    # Sends the message to an object. What the method raises comes back as
    # the value, as long as it is the method's own doing: a `StandardError`,
    # a `ScriptError` (such as `NotImplementedError`), a `SystemStackError`
    # or a `SystemExit`. An `Interrupt`, a signal, a `NoMemoryError` and the
    # exception a `Timeout` uses to end the block go through.
    #
    # @param object [Object] the receiver; a `BasicObject` has no
    #   `public_send`, so the value is a `NoMethodError`
    # @return [Defi::Value] what came back
    def to(object)
      Value.new(object.public_send(name, *args, **opts, &block), false)
    rescue *Value::RAISED => e
      Value.new(e, true)
    end

    # @return [String] the call, as `.name(1, key: 2, &block)`: the arguments
    #   and the keys as their `inspect` writes them (user code, which runs
    #   here), the block as `&block`
    def to_s
      parts = args.map(&:inspect) + opts.map { |key, value| "#{keyword(key)} #{value.inspect}" }
      parts << "&block" if block
      parts.empty? ? ".#{name}" : ".#{name}(#{parts.join(", ")})"
    end

    private

    # A keyword as Ruby writes it: `key:` for a Symbol, quoted when its
    # inspect is, `"key" =>` otherwise.
    def keyword(key)
      key.instance_of?(::Symbol) ? "#{key.inspect[1..]}:" : "#{key.inspect} =>"
    end
  end
end

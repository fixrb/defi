# frozen_string_literal: true

module Defi
  # This class contains a challenge to apply against an object.
  #
  # @api private
  #
  class Challenge < ::BasicObject
    # Initialize the challenge class.
    #
    # @api private
    #
    # @param method [#to_sym] The method to send to an object.
    # @param args   [Array]   Any arguments of the method.
    # @param opts   [Hash]    Any keyword arguments of the method.
    # @param block  [Proc]    Any block argument of the method.
    def initialize(method, *args, **opts, &block)
      @method = method.to_sym
      @args   = args
      @opts   = opts
      @block  = block
    end

    # @api public
    #
    # @param object [#object_id] The object to challenge.
    #
    # @return [#object_id] The actual value, or a raised exception.
    def to(object)
      object.public_send(@method, *@args, **@opts, &@block)
    end

    # Properties of the challenge.
    #
    # @api public
    #
    # @return [Hash] The properties of the challenge.
    def to_h
      {
        method: @method,
        args:   @args,
        opts:   @opts,
        block:  @block
      }
    end

    def to_s
      string = ".#{@method}"

      return string if @args.empty? && @opts.empty? && @block.nil?

      stringified_args  = @args.inspect[1..-2]
      stringified_opts  = @opts.inspect[1..-2]
      stringified_block = '<Proc>' unless @block.nil?

      string += '('

      stringified_items = []

      stringified_items << stringified_args   unless @args.empty?
      stringified_items << stringified_opts   unless @opts.empty?
      stringified_items << stringified_block  unless @block.nil?

      string + stringified_items.join(', ') + ')'
    end

    def inspect
      inspected_method  = @method.inspect
      inspected_args    = @args.inspect
      inspected_opts    = @opts.inspect
      inspected_block   = '<Proc>' unless @block.nil?

      'Defi('                         \
      "method: #{inspected_method}, " \
      "args: #{  inspected_args  }, " \
      "opts: #{  inspected_opts  }, " \
      "block: #{ inspected_block }"   \
      ')'
    end
  end
end

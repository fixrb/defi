# frozen_string_literal: true

module Defi
  # This class contains a challenge to apply against an object.
  #
  # @api private
  #
  class Challenge
    # Initialize the challenge class.
    #
    # @api private
    #
    # @param method [#to_sym] The method to send to an object.
    # @param args   [Array]   The arguments of the method.
    def initialize(method, *args)
      @method = method.to_sym
      @args   = args
    end

    # @api public
    #
    # @param object [#object_id] The object to challenge.
    #
    # @return [#object_id] The actual value, or a raised exception.
    def to(object)
      object.public_send(@method, *@args)
    end

    # Properties of the challenge.
    #
    # @api public
    #
    # @return [Hash] The properties of the challenge.
    def to_h
      {
        method: @method,
        args:   @args
      }
    end
  end
end

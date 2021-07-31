# frozen_string_literal: true

# Namespace for the Defi library.
#
module Defi
  # Expectations are built with this method.
  #
  # @example A :foo challenge
  #   send(:foo) # => #<Defi::Challenge:0x007f96a40925f8 @method=:foo, @args=[]>
  #
  # @param method [#to_sym] The method to send to an object.
  # @param args   [Array]   Any arguments of the method.
  # @param kwargs [Hash]    Any keyword arguments of the method.
  # @param block  [Proc]    Any block argument of the method.
  #
  # @return [Challenge] The challenge instance.
  def self.send(method, *args, **kwargs, &block)
    Challenge.new(method, *args, **kwargs, &block)
  end
end

require_relative File.join("defi", "challenge")

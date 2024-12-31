# frozen_string_literal: true

require_relative File.join("defi", "method")

# Core Ruby module extended to provide the Defi method globally.
# This extension allows for convenient method encapsulation and
# delayed execution through the Defi method, accessible anywhere
# in the Ruby environment.
module Kernel
  # rubocop:disable Naming/MethodName

  # Creates a new Defi::Method instance.
  # This method provides a flexible way to encapsulate a method name along with its
  # arguments, keyword arguments, and an optional block for later invocation.
  #
  # @param method_name [Symbol] The method name to be sent to an object
  # @param args [Array] Positional arguments to be passed to the method
  # @param opts [Hash] Keyword arguments to be passed to the method
  # @param block [Proc] Optional block to be passed to the method
  #
  # @example Basic method without arguments
  #   Defi(:to_s)
  #
  # @example Method with positional arguments
  #   Defi(:+, 2)
  #   Defi(:[], 0, 2)  # For array/string slicing
  #
  # @example Method with keyword arguments
  #   Defi(:transform, x: 1, y: 2)
  #
  # @example Method with a block
  #   Defi(:map) { |x| x * 2 }
  #
  # @example Complex method call
  #   Defi(:reduce, 0, &:+)  # Sum an array
  #
  # @raise [ArgumentError] If method_name is not a Symbol
  #
  # @return [Defi::Method] An instance of Defi::Method encapsulating the method call
  def Defi(method_name, *args, **opts, &block)
    ::Defi::Method.new(method_name, *args, **opts, &block)
  end

  # rubocop:enable Naming/MethodName
end

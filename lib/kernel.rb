# frozen_string_literal: true

require_relative File.join("defi", "method")

# Extension of the Kernel module to include the Defi method.
# The Defi method is a convenient way to create Method objects
# that encapsulate a method name and its arguments, offering a
# dynamic approach to method invocation.
module Kernel
  # Disabling the RuboCop rule for method naming conventions
  # to define a method with an uppercase name for stylistic reasons.
  # rubocop:disable Naming/MethodName

  # Creates a new Defi::Method instance.
  # This method provides a simple and elegant way to encapsulate
  # a method name and its arguments for later invocation.
  #
  # @example Creating a Defi method without arguments
  #   Defi(:foo).inspect # => "Defi(name: :foo, args: [], opts: {}, block: nil)"
  #
  # @example Adding 2 to 1
  #   # Create a Defi method object for addition with an argument of 2
  #   addition = Defi(:+, 2)
  #   addition.inspect # => "Defi(name: :+, args: [2], opts: {}, block: nil)"
  #
  #   # Apply the addition to the number 1
  #   result = addition.to(1)
  #   result # => Value(object: 3, raised: false)
  #
  #   # Execute the addition and get the result
  #   result.call # => 3
  #
  # @param method_name [Symbol] The method name to be sent to an object.
  #
  # @return [Defi::Method] An instance of Defi::Method encapsulating the method name and provided arguments.
  def Defi(method_name, ...)
    ::Defi::Method.new(method_name, ...)
  end

  # Re-enabling the RuboCop rule for method naming conventions.
  # rubocop:enable Naming/MethodName
end

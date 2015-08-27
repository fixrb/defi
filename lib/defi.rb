# Namespace for the Defi library.
#
# @api public
#
module Defi
  # Expectations are built with this method.
  #
  # @api public
  #
  # @example The challenge
  #   on(:foo) # => #<Defi::Challenge:0x007f96a40925f8 @method=:foo, @args=[]>
  #
  # @param method [#to_sym] A public method.
  # @param args   [Array]   A list of arguments.
  #
  # @return [Challenge] The challenge instance.
  def self.on(method, *args)
    Challenge.new(method, *args)
  end
end

require_relative File.join('defi', 'challenge')

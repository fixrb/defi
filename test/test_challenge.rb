# frozen_string_literal: true

require_relative File.join("support", "coverage")
# The file of the class is enough on its own.
require_relative File.join("..", "lib", "defi", "challenge")
require "timeout"

# A challenge is a frozen method call: a name, arguments, a block.
challenge = Defi::Challenge.new(:+, 2)
raise unless challenge.name == :+ && challenge.args == [2] && challenge.opts == {} && challenge.block.nil?
raise unless challenge.frozen? && challenge.args.frozen? && challenge.opts.frozen?
block = proc { |x| x * 2 }
raise unless Defi::Challenge.new(:map, &block).block.equal?(block)
begin
  Defi::Challenge.new("abs")
  raise "expected ArgumentError"
rescue ArgumentError => e
  raise unless e.message == "the name of the method must be a Symbol"
end

# Sent to an object, it brings back what the method returned, the same
# object, raised? being false; an exception returned, not raised, is a
# returned object like any other.
raise unless challenge.to(40).object == 42
raise unless challenge.to(40).raised?.equal?(false)
string = +"x"
raise unless Defi::Challenge.new(:itself).to(string).object.equal?(string)
returned = Defi::Challenge.new(:new, "m").to(RuntimeError)
raise unless returned.raised?.equal?(false) && returned.object.instance_of?(RuntimeError)
raise unless returned.call.equal?(returned.object)
raise unless Defi::Challenge.new(:abs).to(-1).object == 1
raise unless Defi::Challenge.new(:fetch, :b, 7).to({ a: 1 }).object == 7
raise unless Defi::Challenge.new(:map, &block).to([1, 2]).object == [2, 4]
raise unless Defi::Challenge.new(:encode, "US-ASCII", undef: :replace).to("café").object == "caf?"
raise unless Defi::Challenge.new(:merge, { b: 2 }).to({ a: 1 }).object == { a: 1, b: 2 }
pairs = Object.new
def pairs.call(*args, **opts, &block) = [args, opts, block&.call]
raise unless Defi::Challenge.new(:call, 1, k: 2) { 3 }.to(pairs).object == [[1], { k: 2 }, 3]
raise unless Defi::Challenge.new(:call, "k" => 2).to(pairs).object == [[], { "k" => 2 }, nil]
raise unless Defi::Challenge.new(:call).to(pairs).object == [[], {}, nil]

# Or the exception it raised: a StandardError, a ScriptError, a
# SystemStackError or a SystemExit.
value = challenge.to("a")
raise unless value.raised?.equal?(true) && value.object.instance_of?(TypeError)
raise unless Defi::Challenge.new(:boom).to(1).object.instance_of?(NoMethodError)
raise unless Defi::Challenge.new(:fetch, :b).to({}).object.instance_of?(KeyError)
raiser = Object.new
def raiser.call(error) = raise(error)
raise unless Defi::Challenge.new(:call, NotImplementedError).to(raiser).object.instance_of?(NotImplementedError)
raise unless Defi::Challenge.new(:call, SystemStackError).to(raiser).object.instance_of?(SystemStackError)
raise unless Defi::Challenge.new(:call, SystemExit.new(3)).to(raiser).object.instance_of?(SystemExit)
exiter = Object.new
def exiter.call = exit(3)
raise unless Defi::Challenge.new(:call).to(exiter).object.status == 3
deep = Object.new
def deep.call = call
raise unless Defi::Challenge.new(:call).to(deep).object.instance_of?(SystemStackError)

# An interruption, a signal, a shortage of memory or the end of a Timeout
# are not the method's doing: they go through.
custom = Class.new(Exception) # rubocop:disable Lint/InheritException
[Interrupt.new, SignalException.new("TERM"), NoMemoryError.new, custom.new].each do |error|
  Defi::Challenge.new(:call, error).to(raiser)
  raise "#{error.class} did not go through"
rescue Exception => e # rubocop:disable Lint/RescueException
  raise e if e.instance_of?(RuntimeError)
  raise unless e.equal?(error)
end
sleeper = Object.new
def sleeper.call = sleep
begin
  Timeout.timeout(0.05) { Defi::Challenge.new(:call).to(sleeper) }
  raise "expected Timeout::Error"
rescue Timeout::Error
  nil
end

# The message is public: a private method is a NoMethodError, and a
# BasicObject, which has no public_send, as well; send, which is public,
# reaches it, as it does for anyone.
shy = Object.new
def shy.secret = 1
shy.singleton_class.send(:private, :secret)
raise unless Defi::Challenge.new(:secret).to(shy).object.instance_of?(NoMethodError)
raise unless Defi::Challenge.new(:send, :secret).to(shy).object == 1
raise unless Defi::Challenge.new(:__id__).to(BasicObject.new).object.instance_of?(NoMethodError)

# The call, as `.name(args)`: arguments by their inspect, Symbol keys bare.
raise unless Defi::Challenge.new(:abs).to_s == ".abs"
raise unless Defi::Challenge.new(:+, 2).to_s == ".+(2)"
raise unless Defi::Challenge.new(:[], 0, 2).to_s == ".[](0, 2)"
raise unless Defi::Challenge.new(:encode, "W", invalid: :replace, undef: :replace).to_s ==
             '.encode("W", invalid: :replace, undef: :replace)'
raise unless Defi::Challenge.new(:call, "k" => 2).to_s == '.call("k" => 2)'
raise unless Defi::Challenge.new(:call, "foo bar": 1).to_s == '.call("foo bar": 1)'
raise unless Defi::Challenge.new(:fetch, :key, &block).to_s == ".fetch(:key, &block)"
raise unless Defi::Challenge.new(:map, &block).to_s == ".map(&block)"

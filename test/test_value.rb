# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "defi")

# A value holds what came back, frozen; call gives the same object.
returned = Defi::Value.new(42, false)
raise unless returned.object == 42 && returned.raised?.equal?(false) && returned.frozen?
raise unless returned.call == 42
string = +"x"
raise unless Defi::Value.new(string, false).call.equal?(string)

# A raised value raises the same exception again when called, with its own
# cause, even from a rescue clause, where raise would give it a new one.
error = KeyError.new("missing")
raised = Defi::Value.new(error, true)
raise unless raised.object.equal?(error) && raised.raised?.equal?(true)
begin
  raise "outer"
rescue RuntimeError
  begin
    raised.call
    raise "expected KeyError"
  rescue KeyError => e
    raise unless e.equal?(error) && e.cause.nil?
  end
end
caused = begin
  begin
    raise "inner"
  rescue RuntimeError
    raise KeyError, "outer"
  end
rescue KeyError => e
  e
end
begin
  Defi::Value.new(caused, true).call
  raise "expected KeyError"
rescue KeyError => e
  raise unless e.cause.message == "inner"
end

# The cause is read as Exception does: an exception that answers something
# else, or raises, is raised again all the same, with its real cause.
class DefiTestLyingCauseError < StandardError
  def cause = 42
end
lying = begin
  raise DefiTestLyingCauseError
rescue DefiTestLyingCauseError => e
  e
end
begin
  Defi::Value.new(lying, true).call
  raise "expected DefiTestLyingCauseError"
rescue DefiTestLyingCauseError => e
  raise unless e.equal?(lying) && Exception.instance_method(:cause).bind_call(e).nil?
end
class DefiTestRaisingCauseError < StandardError
  def cause = raise("do not ask")
end
begin
  Defi::Value.new(DefiTestRaisingCauseError.new, true).call
  raise "expected DefiTestRaisingCauseError"
rescue DefiTestRaisingCauseError
  nil
end
# A value said to be raised must hold an exception.
begin
  Defi::Value.new(42, true).call
  raise "expected TypeError"
rescue TypeError
  nil
end

# The exceptions a challenge keeps.
kept = Defi::Value::RAISED
raise unless kept == [StandardError, ScriptError, SystemStackError, SystemExit]
raise unless Defi::Value::RAISED.frozen?

# frozen_string_literal: true

require_relative File.join("..", "helper")

OBJECT1 = 42

VALUE1 = Defi::Value.new { OBJECT1 }

raise unless VALUE1.inspect == "Value(object: 42, raised: false)"
raise unless VALUE1.raised? == false
raise unless VALUE1.to_h    == { raised: false, object: OBJECT1 }
raise unless VALUE1.to_s    == "return 42"
raise unless VALUE1.call    == OBJECT1

begin
  Defi::BOOM
rescue NameError => e
  OBJECT2 = e
end

VALUE2 = Defi::Value.new { raise OBJECT2 }
raise unless VALUE2.inspect == "Value(object: uninitialized constant Defi::BOOM, raised: true)"
raise unless VALUE2.raised? == true
raise unless VALUE2.to_h    == { raised: true, object: OBJECT2 }
raise unless VALUE2.to_s    == "raise uninitialized constant Defi::BOOM"

begin
  VALUE2.call
  raise
rescue NameError => e
  raise unless e == OBJECT2
end

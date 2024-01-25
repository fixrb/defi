# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), "support", "*.rb")].each do |path|
  require_relative path
end

require_relative File.join("..", "lib", "defi")

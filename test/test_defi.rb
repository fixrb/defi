# frozen_string_literal: false

require_relative "helper"

Test1.new { Defi(:abs) }.run!
Test2.new { Defi(:*, 7) }.run!
Test3.new { Defi(:BOOM) }.run!

if RUBY_VERSION.start_with?("3.1") # robocop:disabled Style/IfUnlessModifier
  Test4.new { Defi(:encode, "Windows-1252", invalid: :replace, undef: :replace) }.run!
end

block = proc { 42 }
Test5.new { Defi(:fetch, :missing_key, &block) }.run!(mocked_proc: block)

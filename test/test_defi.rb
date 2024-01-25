# frozen_string_literal: false

require_relative "helper"

Test1.new { Defi(:abs) }.run!
Test2.new { Defi(:*, 7) }.run!
Test3.new { Defi(:BOOM) }.run!
Test4.new { Defi(:encode, "Windows-1252", invalid: :replace, undef: :replace) }.run!

block = proc { 42 }
Test5.new { Defi(:fetch, :missing_key, &block) }.run!(mocked_proc: block)

# frozen_string_literal: true

require_relative 'helper'

Test1.new { Defi.send(:abs) }.run!
Test2.new { Defi.send(:*, 7) }.run!
Test3.new { Defi.send(:BOOM) }.run!
Test4.new { Defi.send(:encode, 'Windows-1252', invalid: :replace, undef: :replace) }.run!

block = proc { 42 }
Test5.new { Defi.send(:fetch, :missing_key, &block) }.run!(mocked_proc: block)

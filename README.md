# Defi

[![Version](https://img.shields.io/github/v/tag/fixrb/defi?label=Version&logo=github)](https://github.com/fixrb/defi/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/defi/main)
[![License](https://img.shields.io/github/license/fixrb/defi?label=License&logo=github)](https://github.com/fixrb/defi/raw/main/LICENSE.md)

Defi prepares a method call, a name with its arguments, and sends it to any object, keeping what came back: the value returned, or the exception raised. The same call can be sent to as many objects as you like, to compare what each one does with it.

## Installation

```ruby
# Gemfile
gem "defi"
```

Defi requires Ruby 3.3 or later, and depends on nothing.

## Usage

A challenge is a method name, with positional arguments, keyword arguments and a block, as you would write them after a dot:

```ruby
require "defi"

challenge = Defi::Challenge.new(:fetch, :b, 0)
challenge.to_s # => ".fetch(:b, 0)"
```

Sent to an object with `to`, it brings back a value: what the method returned, or what it raised.

```ruby
value = challenge.to({ b: 2 })
value.raised? # => false
value.object  # => 2
value.call    # => 2

value = Defi::Challenge.new(:fetch, :b).to({})
value.raised? # => true
value.object  # => #<KeyError: key not found: :b>
value.call    # raises the KeyError again
```

Keyword arguments and the block go through as they are:

```ruby
Defi::Challenge.new(:encode, "US-ASCII", undef: :replace).to("café").object # => "caf?"
Defi::Challenge.new(:map) { |n| n * 2 }.to([1, 2]).object # => [2, 4]
```

## What comes back

The message is sent with `public_send`: a private method, or a `BasicObject`, which has no `public_send`, gives a `NoMethodError`. `public_send` protects the named method only: a challenge of `send` or `instance_eval`, which are public, reaches what they reach.

A challenge keeps as its value the exceptions a method raises on its own: a `StandardError`, a `ScriptError` (such as `NotImplementedError`), a `SystemStackError`, or the `SystemExit` of an `exit` or an `abort`. What is not the method's doing goes through: an `Interrupt`, a `SignalException`, a `NoMemoryError`, the exception a `Timeout` uses to end its block (a `Timeout` given a class to raise, such as `RuntimeError`, is kept like any `StandardError`), and any other subclass of `Exception`. `Defi::Value::RAISED` lists the classes kept. `call` raises the exception again, the same object, with its own cause.

`to_s` writes the call as `.name(1, key: 2, &block)`: the arguments and the keys by their `inspect`, which runs their code and can change from one Ruby to the next (a Hash in 3.4, a Set in 4.0), the block as `&block`.

A challenge and a value are frozen. Their arguments are the objects given, not copies: a mutable argument stays shared with the caller.

## Changes in 4.0

Compared with 3.0.1:

- `Defi::Method` becomes `Defi::Challenge`, a plain class, no longer a `BasicObject`, in `defi/challenge.rb`: `require "defi/method"` becomes `require "defi"`. `Kernel#Defi`, which every object received as a public method, is gone: write `Defi::Challenge.new`.
- `to` keeps the exceptions of the method only, where 3.0.1 caught every `Exception`, `Timeout` and `Interrupt` included. A name that is not a Symbol raises `ArgumentError`, as documented, with a new message; the `BasicObject` could not even `raise`. `call` keeps the cause of the exception it raises again.
- `Challenge#to_s` writes keyword arguments as `key: value` and the block as `&block`. `args` and `opts` are frozen. `Value.new` takes the object and whether it was raised; `Value::RAISE` and `Value::RETURN` are gone, as are `to_h` on both classes, `to_s` on a value and the custom `inspect` methods.
- Ruby 3.3 or later; tested on 3.3, 3.4, 4.0 and head.

## Versioning

Defi follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/defi) is available as open source under the terms of the [MIT License](https://github.com/fixrb/defi/raw/main/LICENSE.md).

## Sponsors

This project is sponsored by [Sashité](https://sashite.com/)

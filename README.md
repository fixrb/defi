# Defi

[![Build Status](https://api.travis-ci.org/fixrb/defi.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/defi.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/defi.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Challenge library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'defi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defi

## Usage

Let's multiply by `7` the number `6`:

```ruby
Defi.send(:*, 7).to(6).call # => 42
```

Now, let's challenge "`foo`" with `boom` method:

```ruby
Defi.send(:boom).to('foo').call # NoMethodError: undefined method `boom' for "foo":String
```

Let's challenge "`hello world`" with `gsub!` in isolation:

```ruby
some_text = 'hello world'
Defi.send(:gsub!, 'world', 'Alice').to!(some_text).call # => "hello Alice"
some_text # => "hello world"
```

## Contact

* Home page: https://github.com/fixrb/defi
* Bugs/issues: https://github.com/fixrb/defi/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](https://rubinius.com/)
* [JRuby](https://www.jruby.org/)

## Versioning

__Defi__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/defi/raw/master/img/sashite.png"
    alt="Sashite" /></a>
</p>

[gem]: https://rubygems.org/gems/defi
[travis]: https://travis-ci.org/fixrb/defi
[inchpages]: https://inch-ci.org/github/fixrb/defi
[rubydoc]: https://rubydoc.info/gems/defi/frames

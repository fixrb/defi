# Defi

[![Version](https://img.shields.io/github/v/tag/fixrb/defi?label=Version&logo=github)](https://github.com/fixrb/defi/releases)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/defi/main)
[![CI](https://github.com/fixrb/defi/workflows/CI/badge.svg?branch=main)](https://github.com/fixrb/defi/actions?query=workflow%3Aci+branch%3Amain)
[![RuboCop](https://github.com/fixrb/defi/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/defi/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/defi?label=License&logo=github)](https://github.com/fixrb/defi/raw/main/LICENSE.md)

> Challenge library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "defi"
```

And then execute:

```sh
bundle
```

Or install it yourself as:

```sh
gem install defi
```

## Usage

Let's multiply by `7` the number `6`:

```ruby
Defi.send(:*, 7).to(6).call # => 42
```

Now, let's challenge "`foo`" with `boom` method:

```ruby
Defi.send(:boom).to("foo").call # NoMethodError: undefined method `boom' for "foo":String
```

Let's challenge "`hello world`" with `gsub!` in isolation:

```ruby
some_text = "hello world"
Defi.send(:gsub!, "world", "Alice").to!(some_text).call # => "hello Alice"
some_text # => "hello world"
```

## Contact

* Source code: https://github.com/fixrb/defi/issues

## Versioning

__Defi__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/defi) is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/defi/raw/main/img/sashite.png"
    alt="Sashite" /></a>
</p>

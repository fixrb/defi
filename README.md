# Defi

[![Build Status](https://api.travis-ci.org/fixrb/defi.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/defi/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/defi.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/defi.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Challenge library.

## Contact

* Home page: https://github.com/fixrb/defi
* Bugs/issues: https://github.com/fixrb/defi/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](https://rubinius.com/)
* [JRuby](https://www.jruby.org/)

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

## Security

As a basic form of security __Defi__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/defi-1.0.0.gem
    c30380a253c932bbff42a36611466f2b7d59e6a1d9578a4989e7b2cfd4078cf9d64e452b0eaa055c5ab88be4816d3f366d7aa705d29bb54e2db9f75d21f36cf7  pkg/defi-1.0.0.gem

## Versioning

__Defi__ follows [Semantic Versioning 2.0](https://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/defi/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/defi
[travis]: https://travis-ci.org/fixrb/defi
[codeclimate]: https://codeclimate.com/github/fixrb/defi
[inchpages]: https://inch-ci.org/github/fixrb/defi
[rubydoc]: https://rubydoc.info/gems/defi/frames

***

<p>
  This project is sponsored by:

  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/defi/raw/bdf560d73e7ff2306f6f4a071ced36b383cbf35d/img/sashite.png"
    alt="Sashite" /></a>
</p>

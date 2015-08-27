# Defi

[![Build Status](https://travis-ci.org/fixrb/defi.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/defi.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/defi.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Challenge library.

## Contact

* Home page: https://github.com/fixrb/defi
* Bugs/issues: https://github.com/fixrb/defi/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

__Defi__ is cryptographically signed.

To be sure the gem you install hasn't been tampered with, add my public key (if you haven't already) as a trusted certificate:

    $ gem cert --add <(curl -Ls https://raw.github.com/fixrb/defi/master/certs/gem-fixrb-public_cert.pem)
    $ gem install defi -P HighSecurity

The `HighSecurity` trust profile will verify all gems.  All of __Defi__'s dependencies are signed.

Or add this line to your application's Gemfile:

```ruby
gem 'defi'
```

And then execute:

    $ bundle

## Usage

Let's challenge -42 to return its absolute value.

```ruby
Defi.on(:abs).to(-42).object # => 42
```

Now let's challenge 'foo' to return its absolute value.

```ruby
Defi.on(:abs).to('foo').object # => #<NoMethodError: undefined method `abs' for "foo":String>
```

## Security

As a basic form of security __Defi__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/defi-0.1.0.gem
    e9e35e1953104e2d428b0f217e418db3c1baecd9e011b2545f9fcba4ff7e3bba674c6b928b3d8db842a139cd7cc9806d77ebdc7f710ece4f2aecb343703e2451  pkg/defi-0.1.0.gem

## Versioning

__Defi__ follows [Semantic Versioning 2.0](http://semver.org/).

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
[inchpages]: http://inch-ci.org/github/fixrb/defi/
[rubydoc]: http://rubydoc.info/gems/defi/frames

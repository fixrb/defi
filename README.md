# Defi

[![Build Status](https://travis-ci.org/fixrb/defi.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/defi/badges/gpa.svg)][codeclimate]
[![Dependency Status](https://gemnasium.com/fixrb/defi.svg)][gemnasium]
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

Let's challenge `6` to be multiplied by seven.

```ruby
Defi.send(:*, 7).to(6) # => 42
```

Now let's challenge `"foo"` to respond to a boom method.

```ruby
Defi.send(:boom).to('foo') # NoMethodError: undefined method `boom' for "foo":String
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
[codeclimate]: https://codeclimate.com/github/fixrb/defi
[gemnasium]: https://gemnasium.com/fixrb/defi
[inchpages]: http://inch-ci.org/github/fixrb/defi
[rubydoc]: http://rubydoc.info/gems/defi/frames

***

This project is sponsored by:

[![Sashite](http://sashite.com/img/sashite.png)](http://www.sashite.com/)

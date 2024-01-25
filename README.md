# Defi

[![Version](https://img.shields.io/github/v/tag/fixrb/defi?label=Version&logo=github)](https://github.com/fixrb/defi/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/defi/main)
[![Ruby](https://github.com/fixrb/defi/workflows/Ruby/badge.svg?branch=main)](https://github.com/fixrb/defi/actions?query=workflow%3Aruby+branch%3Amain)
[![RuboCop](https://github.com/fixrb/defi/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/defi/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/defi?label=License&logo=github)](https://github.com/fixrb/defi/raw/main/LICENSE.md)

**Defi** is a streamlined Ruby library designed for the specification of method arguments while respecting their signatures.
Rather than representing method signatures themselves, Defi focuses on providing a way to furnish methods with appropriate arguments, thereby preparing them for invocation.

This approach serves as an alternative to traditional methods like `Object#method` and `UnboundMethod`.
Where `Object#method` is bound to a specific object and `UnboundMethod` requires compatibility with the method’s originating class, Defi offers a more flexible and universal way to prepare method calls.
It allows method arguments to be specified in advance and then applied to any compatible object – those equipped with corresponding methods.

Defi is particularly useful in scenarios where you need to apply a set of method arguments across different objects to observe the varying outcomes, whether they be returned values or exceptions.
This makes it an ideal tool for testing, method comparison across different implementations, or any situation where method behavior needs to be assessed dynamically across various objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "defi"
```

And then execute:

```sh
bundle install
```

Or install it yourself as:

```sh
gem install defi
```

## Usage

The `Defi` library simplifies the task of applying method signatures to various objects, regardless of their type (instances, modules, etc.).
Below are some detailed examples to demonstrate its versatility and ease of use:

### Example 1: Multiplying Numbers

Suppose you want to multiply the number `6` by `7`.
With `Defi`, this can be elegantly done as follows:

```ruby
result = Defi(:*, 7).to(6).call
puts result # Output: 42
```

Here, `Defi(:*, 7)` creates a challenge with the multiplication method (`:*`) and the argument `7`.
The `.to(6)` method specifies that this challenge should be applied to the number `6`.
Finally, `.call` executes the challenge, yielding the result `42`.

### Example 2: Invoking an Undefined Method

`Defi` also elegantly handles cases where the method might not exist on the target object.
For instance:

```ruby
begin
  Defi(:boom).to("foo").call
rescue NoMethodError => e
  puts e.message # Output: undefined method `boom' for "foo":String
end
```

In this example, we attempt to call the non-existent method `boom` on the string `"foo"`.
`Defi` correctly raises a `NoMethodError`, showing that the method `boom` is undefined for a `String` object.

## Contact

* Source code: https://github.com/fixrb/defi/issues

## Versioning

__Defi__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/defi) is available as open source under the terms of the [MIT License](https://github.com/fixrb/defi/raw/main/LICENSE.md).

---

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/defi/raw/main/img/sashite.png"
    alt="Sashité" /></a>
</p>

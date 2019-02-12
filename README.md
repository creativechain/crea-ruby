[![Gem Version](https://badge.fury.io/rb/crea-ruby.svg)](https://badge.fury.io/rb/crea-ruby)
[![Inline docs](http://inch-ci.org/github/creativechain/crea-ruby.svg?branch=master&style=shields)](http://inch-ci.org/github/creary/crea-ruby)

# `crea-ruby`

Crea-ruby the Ruby API for Crea blockchain.

Full documentation: http://www.rubydoc.info/gems/crea-ruby

**Note:** *This library depends on AppBase methods that are a work in progress.*

## Getting Started

The crea-ruby gem is compatible with Ruby 2.2.5 or later.

### Install the gem for your project

*(Assuming that [Ruby is installed](https://www.ruby-lang.org/en/downloads/) on your computer, as well as [RubyGems](http://rubygems.org/pages/download))*

To install the gem on your computer, run in shell:

```bash
gem install crea-ruby
```

... then add in your code:

```ruby
require 'crea'
```

To add the gem as a dependency to your project with [Bundler](http://bundler.io/), you can add this line in your Gemfile:

```ruby
gem 'crea-ruby', require: 'crea'
```

## Examples

### Broadcast Vote

```ruby
params = {
  voter: voter,
  author: author,
  permlink: permlink,
  weight: weight
}

Crea::Broadcast.vote(wif: wif, params: params) do |result|
  puts result
end
```

*See: [Broadcast](https://www.rubydoc.info/gems/crea-ruby/Crea/Broadcast)*

### Streaming

The value passed to the block is an object, with the keys: `:type` and `:value`.

```ruby
stream = Crea::Stream.new

stream.operations do |op|
  puts "#{op.type}: #{op.value}"
end
```

To start a stream from a specific block number, pass it as an argument:

```ruby
stream = Crea::Stream.new

stream.operations(at_block_num: 9001) do |op|
  puts "#{op.type}: #{op.value}"
end
```

You can also grab the related transaction id and block number for each operation:

```ruby
stream = Crea::Stream.new

stream.operations do |op, trx_id, block_num|
  puts "#{block_num} :: #{trx_id}"
  puts "#{op.type}: #{op.value}"
end
```

To stream only certain operations:

```ruby
stream = Crea::Stream.new

stream.operations(types: :vote_operation) do |op|
  puts "#{op.type}: #{op.value}"
end
```

Or pass an array of certain operations:

```ruby
stream = Crea::Stream.new

stream.operations(types: [:comment_operation, :vote_operation]) do |op|
  puts "#{op.type}: #{op.value}"
end
```

Or (optionally) just pass the operation(s) you want as the only arguments.  This is semantic sugar for when you want specific types and take all of the defaults.

```ruby
stream = Crea::Stream.new

stream.operations(:vote_operation) do |op|
  puts "#{op.type}: #{op.value}"
end
```

To also include virtual operations:

```ruby
stream = Crea::Stream.new

stream.operations(include_virtual: true) do |op|
  puts "#{op.type}: #{op.value}"
end
```

### Multisig

You can use multisignature to broadcast an operation.

```ruby
params = {
  voter: voter,
  author: author,
  permlink: permlink,
  weight: weight
}

Crea::Broadcast.vote(wif: [wif1, wif2], params: params) do |result|
  puts result
end
```

In addition to signing with multiple `wif` private keys, it is possible to also export a partially signed transaction to have signing completed by someone else.

```ruby
builder = Crea::TransactionBuilder.new(wif: wif1)

builder.put(vote: {
  voter: voter,
  author: author,
  permlink: permlink,
  weight: weight
})

trx = builder.sign.to_json

File.open('trx.json', 'w') do |f|
  f.write(trx)
end
```

Then send the contents of `trx.json` to the other signing party so they can privately sign and broadcast the transaction.

```ruby
trx = open('trx.json').read
builder = Crea::TransactionBuilder.new(wif: wif2, trx: trx)
api = Crea::CondenserApi.new
trx = builder.transaction
api.broadcast_transaction_synchronous(trx)
```

### Get Accounts

```ruby
api = Crea::DatabaseApi.new

api.find_accounts(accounts: ['creary', 'alice']) do |result|
  puts result.accounts
end
```

*See: [Api](https://www.rubydoc.info/gems/crea-ruby/Crea/Api)*

### Reputation Formatter

```ruby
rep = Crea::Formatter.reputation(account.reputation)
puts rep
```

### Tests

* Clone the client repository into a directory of your choice:
  * `git clone https://github.com/creary/crea-ruby.git`
* Navigate into the new folder
  * `cd crea-ruby`
* All tests can be invoked as follows:
  * `bundle exec rake test`
* To run `static` tests:
  * `bundle exec rake test:static`
* To run `broadcast` tests (broadcast is simulated, only `verify` is actually used):
  * `bundle exec rake test:broadcast`
* To run `threads` tests (which quickly verifies thread safety):
  * `bundle exec rake test:threads`
* To run `testnet` tests (which does actual broadcasts)
  * `TEST_NODE=https://testnet.crearydev.com bundle exec rake test:testnet`

You can also run other tests that are not part of the above `test` execution:

* To run `block_range`, which streams blocks (using `json-rpc-batch`)
  * `bundle exec rake stream:block_range`


If you want to point to any node for tests, instead of letting the test suite pick the default, set the environment variable to `TEST_NODE`, e.g.:

```bash
$ TEST_NODE=https://api.crearydev.com bundle exec rake test
```

## Contributions

Patches are welcome! Contributors are listed in the `crea-ruby.gemspec` file. Please run the tests (`rake test`) before opening a pull request and make sure that you are passing all of them. If you would like to contribute, but don't know what to work on, check the issues list.

## Issues

When you find issues, please report them!

## License

MIT

# Billogram
![](https://github.com/mbirman/billogram/workflows/Test/badge.svg)

Simple ruby wrapper for [Billogram](https://billogram.com) API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'billogram'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install billogram

## Usage

First you need to configure the client

```ruby
Billogram.configure do |config|
  config.username = "6402-qz0UHqRJ"
  config.password = "55e041056840d54dc8274f70c0a4170f"
end
```

Add this code to `config/initializers/billogram.rb` if you're using Rails and don't forget to restart the server.

Next step is to actually make API calls. Dead simple.

## Resources

We have 7 endpoints each represented by a class: `Invoice`, `Item`, `Customer`, `Event`, `Settings`, `Report`, `Logotype`

Most of them support create, fetch, update actions as well as [search](https://billogram.com/api/documentation#object_search_parameters).

Also there are nested resources (Address for instance), you cannot get them directly but only through the resource they belong.

```ruby
  Billogram::Address.search()               # =>  undefined method `search' for Billogram::Address:Class
  customer = Billogram::Customer.fetch(32)
  customer.address                          # => #<Billogram::Address:0x007f9aebafd358>
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mbirman/billogram.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# RequestContext

This is a gem that adds a hash containing request information to `Thread.current[:request\_context]`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'request_context'
```

## Usage

Add the rack middleware:

```ruby
use Rack::RequestContext
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

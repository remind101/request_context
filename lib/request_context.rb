require 'request_context/version'

module Rack
  autoload :RequestContext, 'rack/request_context'
end

module RequestContext

  class << self

    # Public: Retrieve the current request_context, which is set by the Rack middleware.
    #
    # Examples
    #
    #   RequestContext.request_context.url
    #   # => 'https://www.remind101.com'

    #
    # Returns Rack::Request.
    def request_context
      Thread.current[:request_context]
    end

    # Internal: Set the current request_context.
    #
    # Examples
    #
    #   RequestContext.request_context = Rack::Request(env)
    #   # => #<Rack::Request:0x007fe675a39950 @env={...}>
    #
    # Returns the new Rack::Request request context.
    def request_context=(request_context)
      Thread.current[:request_context] = request_context
    end

  end
end

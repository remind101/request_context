module Rack

  # Public: Rack middleware that stores Rack Request in a thread local variable.
  #
  # app - The Rack app.
  #
  # Examples
  #
  #   use Rack::RequestContext
  #
  #   puts "Thread.current[:request_context].url"
  #   # => 'https://www.remind101.com'
  class RequestContext

    def initialize(app)
      @app = app
    end

    def call(env)
      ::RequestContext.request_context = Rack::Request.new(env)
      @app.call(env)
    ensure
      ::RequestContext.request_context = nil
    end

  end
end

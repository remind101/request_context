module Rack

  # Public: Rack middleware that stores request data in a
  # thread local variable.
  #
  # app - The Rack app.
  #
  # Examples
  #
  #   use Rack::RequestContext
  #
  #   puts "Thread.current[:request_context]"
  #   # => {origo: nil, url: 'https...', user_agent: 'Mozilla...', referrer: 'http...', ip: '1.1.1.1'}
  class RequestContext

    def initialize(app)
      @app = app
    end

    def call(env)
      ::RequestContext.request_context = Rack::Request.new(env)
      @app.call(env)
    end

  end
end

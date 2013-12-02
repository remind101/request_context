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
      ::RequestContext.with_request_context(request_context(env)) do
        @app.call(env)
      end
    end

  private

    def request_context(env)
      request = Rack::Request.new(env)
      { origo:      request.cookies['origo'],
        url:        request.url,
        user_agent: request.user_agent,
        referrer:   request.referer,
        ip:         request.ip }
    end

  end
end

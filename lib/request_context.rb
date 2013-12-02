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
    #   RequestContext.request_context
    #   # => {:origo=>nil,
    #   #     :url=>"http://localhost:5000/v2/groups/31419?group%5Bclass_name%5D=Spanish+6&auth_token=btVuzxrUYcaYJvnkVTbA",
    #   #     :user_agent=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36",
    #   #     :referrer=>"http://localhost:5000/",
    #   #     :ip=>"127.0.0.1"}

    #
    # Returns the Hash request context.
    def request_context
      Thread.current[:request_context]
    end

    # Internal: Set the current request_context.
    #
    # Examples
    #
    #   RequestContext.request_context = {origo: nil, url: 'https://www.remind101.com'}
    #   # => {origo: nil, url: 'https://www.remind101.com'}
    #
    # Returns the new Hash request context.
    def request_context=(request_context)
      Thread.current[:request_context] = request_context
    end

  end
end

require 'spec_helper'
require 'rack/test'

describe Rack::RequestContext do
  let(:app) { double('app', call: [200, {}, ['Body']]) }
  let(:middleware) { described_class.new app }

  describe '.call' do
    let(:request_context) { Rack::Request.new({}) }

    it 'stores the request_context in a thread local' do
      Thread.current.should_receive(:[]=).with(:request_context, request_context)
      app.should_receive(:call)
      Thread.current.should_receive(:[]=).with(:request_context, nil)
      middleware.call({})
    end

  end

end

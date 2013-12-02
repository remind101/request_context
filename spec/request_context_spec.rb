require 'spec_helper'

describe RequestContext do
  let(:request_context) { Rack::Request.new({}) }

  describe '.request_context' do
    subject { described_class.request_context }

    context 'when Thread.current[:request_context] is set' do
      before { Thread.current[:request_context] = request_context }
      it { should eq Thread.current[:request_context] }
    end
  end

  describe '.request_context=' do
    it 'sets Thread.current[:request_context]' do
      Thread.current.should_receive(:[]=).with(:request_context, request_context)
      described_class.request_context = request_context
    end
  end

end

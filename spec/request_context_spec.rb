require 'spec_helper'

describe RequestContext do
  let(:request_context) do
    { origo:      nil,
      url:        'https://www.remind101.com',
      user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36',
      referrer:   'http://search.yahoo.com/search?p=remind101',
      ip:         '127.0.0.1' }
  end

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

  describe '.with_request_context' do
    before { Thread.current[:request_context] = request_context }

    it 'sets the request_context to the new request_context' do
      described_class.with_request_context( {url: 'https://www.remind101.com', ip: '10.10.10.10'} ) do
        expect(described_class.request_context).to eq({url: 'https://www.remind101.com', ip: '10.10.10.10'})
      end
      expect(described_class.request_context).to eq request_context
    end
  end
end

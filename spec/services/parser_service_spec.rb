require 'rails_helper'

RSpec.describe ParserService do
  let(:url) { 'some uri' }
  let(:selector) { 'some selector' }

  it 'calls .call' do
    expect(ParserService).to receive(:call).with(url, selector)

    ParserService.call(url, selector)
  end
end

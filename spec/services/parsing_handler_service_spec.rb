require 'rails_helper'

RSpec.describe ParsingHandlerService do
  let(:url) { 'https://www.cbr.ru/' }
  let(:selector) { '.indicator_el_value.mono-num' }
  let(:service) { ParsingHandlerService.call(url, selector) }

  it 'calls .call' do
    expect(ParsingHandlerService).to receive(:call).with(url, selector)

    service
  end

  it 'returns array' do
    expect(service).to be_instance_of(Array)
  end
end

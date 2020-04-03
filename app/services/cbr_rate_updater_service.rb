class CbrRateUpdaterService
  def self.call
    url = 'https://www.cbr.ru/'
    selector = '.indicator_el_value.mono-num'

    data = ParsingHandlerService.call(url, selector)

    Currency.where(title: 'USD').update(current_rate: data[0], tomorrow_rate: data[1])

    ActionCable.server.broadcast(
      'rate_channel',
        current_rate: data[0]
      )
  end
end

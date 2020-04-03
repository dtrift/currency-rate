class ParsingHandlerService
  def self.call(url, selector)
    data = ParserService.call(url, selector)

    data_ucr = data[0].content.chop.split(',')
    usd_current_rate = (data_ucr[0] + '.' + data_ucr[1]).to_f

    data_utr = data[1].content.chop.split(',')
    usd_tomorrow_rate = (data_utr[0] + '.' + data_utr[1]).to_f

    [usd_current_rate, usd_tomorrow_rate]
  end
end

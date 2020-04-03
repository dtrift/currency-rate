url = 'https://www.cbr.ru/'
selector = '.indicator_el_value.mono-num'

data = ParsingHandlerService.call(url, selector)

currencies = Currency.create!([
  { title: 'USD', current_rate: data[0], tomorrow_rate: data[1] },
  # { title: 'EURO', current_rate: data[2], tomorrow_rate: data[3] }
])



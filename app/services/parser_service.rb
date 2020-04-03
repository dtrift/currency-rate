require 'open-uri'
require 'nokogiri'
require 'json'

class ParserService
  class << self
    def call(url, selector)
      document = new_document(url)
      result(document, selector)
    end

    private

    def new_document(url)
      Nokogiri::HTML(open(url))
    end

    def result(document, selector)
      result = []

      document.css(selector).each do |node|
        content = node['content']
        result.push(content: content)
      end
    end
  end
end

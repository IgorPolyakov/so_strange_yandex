require 'open-uri'
require 'nokogiri'
class YanParser
  attr_reader :page
  # @page = Nokogiri::HTML(open("https://www.yandex.ru/"))
  # puts @page
  def title
    @page = Nokogiri::HTML(open("https://www.yandex.ru/"))
    @page.css('title').text
  end

end
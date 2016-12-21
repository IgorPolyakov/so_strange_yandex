require 'open-uri'
require 'nokogiri'
class YanParser
  @page
  def title
    @page = Nokogiri::HTML(open("https://www.yandex.ru/"))
    @page.css('title').text
  end
end
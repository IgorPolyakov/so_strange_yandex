require 'sinatra'
require 'easy_translate'
require_relative 'yanparser'

get '/' do
  @page = Nokogiri::HTML(open("https://yandex.com/"))
  # Thankyou strange guy 'huangw' from github
  EasyTranslate.api_key = 'AIzaSyCv3vyT7t4xXiBLg_yKmY0NuaZq8I1YX8M'#'AIzaSyDPOAhODUCwTVebYNMzSa1HsoG-nad0U3w'

  iter = @page.css('.heap__row').css('.link')
  iter.each { |x| x.content = 'fuck'}#EasyTranslate.translate(x.text, :to => 'en') }

  search_button = @page.at_css('.button_theme_websearch')
  search_button.replace('<button id="myButton" class="button suggest2-form__button button_theme_websearch button_size_ws-head"> <span class="button__text">Хуй</span> </button>')
  erb :index
end

get '/search/:query' do |query_text|
  url = "https://yandex.ru/search/?lr=75&text=" + query_text
  @page = Nokogiri::HTML(open(url))
  new_list = @page.css('.serp-list').css('.serp-list_left_yes').css('.serp-item').reverse
  @page.css('.serp-list').css('.serp-list_left_yes').css('.serp-item').each { |x| x.replace('') }
  @page.css('.serp-list').at_css('.serp-list_left_yes').add_next_sibling(new_list)
  erb :search
end
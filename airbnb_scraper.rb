require 'open-uri'
require 'nokogiri'

#Store url to be scraped
url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"
#Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

#Display output onto the screen
page.css('div.h5.listing-name').each do |line|
	puts line.text
end
require 'open-uri'
require 'nokogiri'
require 'csv'

#Store url to be scraped
url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"
#Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

#Store data in arrays
name = []
page.css('div.h5.listing-name').each do |line|
	name << line.text
end

price = []
page.css('span.h3.price-amount').each do |line|
	price << line.text
end

details = []
page.css('div.text-muted.listing-location.text-truncate').each do |line|
	details << line.text
end
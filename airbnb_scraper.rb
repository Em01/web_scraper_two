require 'open-uri'
require 'nokogiri'
require 'csv'

#Store url to be scraped
url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"
#Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

#Scrape the max number of pages and store in max_page variable
page_numbers = []
page.css("div.pagination ul li a[target]").each do |line|
	page_numbers << line.text
end
#find the div tag in pagination, then find the ul tag nested inside the div and then li tag nested inside the ul tag and an a tag with a target attribute nested inside the li tag.

max_page = page_numbers.max

max_page.to_i.times do |i|

	url = "https://www.airbnb.com/s/Brooklyn--NY--United-States?page=#{i+1}"
	page = Nokogiri::HTML(open(url))

#Store data in arrays
	name = []
	page.css('div.h5.listing-name').each do |line|
		name << line.text.strip
	end

	price = []
	page.css('span.h3.price-amount').each do |line|
		price << line.text
	end

	details = []
	page.css('div.text-muted.listing-location.text-truncate').each do |line|
		details << line.text.strip.split(/ · /)
	end
end

#write data to CSV file
# CSV.open("airbnb_listings.csv", "w") do |file|
# 	file << ["Listing Name", "Price", "Room Type", "Reviews", "Location"]
# 	name.length.times do |i|
# 		file << [name[i], price[i], details[i][0], details[i][1], details[i][2]]
# 	end
end





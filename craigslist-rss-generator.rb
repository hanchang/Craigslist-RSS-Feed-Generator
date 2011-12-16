cities = ["San Francisco", "Los Angeles", "New York", "Boston", "Austin", "Philadelphia", "Seattle", "Sacramento", "Dallas", "Denver", "Houston", "Las Vegas"]
queries = ["chinese translator", "chinese translation", "chinese translate", "chinese translating"]

def generateXmlUrl(city, query)
    generateHtmlUrl(city, query) + "&amp;format=rss"
end

def generateHtmlUrl(city, query)
    "http://" + city + ".craigslist.org/search/ggg?query=" + query + "&amp;srchType=A&amp;addThree=forpay"
end

def printOutline(text, title, xmlUrl, htmlUrl) 
    puts "\t\t\t" + '<outline text="' + title + '" title="' + title + '" type="rss" xmlUrl="' + xmlUrl + '" htmlUrl="' + htmlUrl + '" />'
end

# Start printing!

puts '<?xml version="1.0" encoding="UTF-8"?>'
puts '<opml version="1.0">'
puts "\t<head>"
puts "\t\t<title>Sharon subscriptions in Google Reader</title>\t\t"
puts "\t</head>"
puts "\t<body>"
puts "\t\t" + '<outline title="Chinese Translation" text="Chinese Translation">'

cities.each do |city|
    queries.each do |query|
        title = "Craigslist - " + city + " " + query
        city_ = city.downcase.gsub(/\s+/, "") # lowercase and no spaces since this is subdomain
        query_ = query.gsub(/\s+/, "+") # replace spaces with + since this is a query
        printOutline(title, title, generateXmlUrl(city_, query_), generateHtmlUrl(city_, query_))
    end
end

puts "\t\t</outline>"
puts "\t</body>"
puts "</opml>"

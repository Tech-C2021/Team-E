require 'nokogiri'
require 'httparty'
require 'openssl'
require_relative '../libs/realPath.rb'
class ScrapingController
    def initialize
        @url = "https://www.dotabuff.com/heroes/meta"
    end

    def fileReader(uri)
        html = HTTParty.get(uri)
        nokogiriDoc = Nokogiri.parse(html) 
        return nokogiriDoc
    end

    def getAllHeroNames()
        allHeorNames = []
        nokogiriDoc = fileReader('https://www.dotabuff.com/heroes')
        nokogiriDoc.css('.name').each do |a|
            allHeorNames.push(a.text)
        end
        return allHeorNames
    end

    def getBasicHeroInfoForMainTable(query)
        html = fileReader(@url)
    end

end

#p name.map {|x| x[/\d+.\d+/]}

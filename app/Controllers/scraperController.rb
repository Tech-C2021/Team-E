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

    def getMetaHeroes()
    begin
        reconstructedStats = []
        nokogiriDoc = fileReader(@url)

        nokogiriDoc.css('tr').each do |meta|
            allData = meta.text.split("%")
            statistics = allData.map {|x| x[/\d+.\d+/]}
            names = allData.map {|x| x[/[a-z" "A-Z]+/]}
            constructStats = {
                "name" => names[0],
                "lowTeirPickRate" => statistics[0],
                "lowTeirWinRate" => statistics[1],
                "beginnerTeirPickRate" => statistics[2],
                "beginnerTeirWinRate" => statistics[3],
                "interemediateTeirPickRate" => statistics[4],
                "interemediateTeirWinRate" => statistics[5],
                "highTeirPickRate" => statistics[6],
                "highTeirWinRate" => statistics[7],
                "topTeirPickRate" => statistics[8],
                "topTeirWinRate" => statistics[9],
            }
            reconstructedStats.push(constructStats)
        
        end
            return reconstructedStats.to_json
    rescue StandardError => e
        p e
    end
end
end

#p name.map {|x| x[/\d+.\d+/]}

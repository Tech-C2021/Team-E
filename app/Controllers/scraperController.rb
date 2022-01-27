require 'nokogiri'
require 'httparty'
require 'openssl'
require_relative '../libs/realPath.rb'
require_relative'../Repositories/heroesRepository.rb'
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

    def getHeroesWithStats()
    begin
        reconstructedStats = []
        nokogiriDoc = fileReader(@url)

        nokogiriDoc.css('tr').each do |meta|
            allData = meta.text.split("%")
            statistics = allData.map {|x| x[/\d+.\d+/]}
            names = allData.map {|x| x[/[a-z" "A-Z]+/]}
            constructStats = {
                "name" => names[0],
                "lowTierPickRate" => statistics[0],
                "lowTierWinRate" => statistics[1],
                "beginnerTierPickRate" => statistics[2],
                "beginnerTierWinRate" => statistics[3],
                "intermediateTierPickRate" => statistics[4],
                "intermediateTierWinRate" => statistics[5],
                "highTierPickRate" => statistics[6],
                "highTierWinRate" => statistics[7],
                "topTierPickRate" => statistics[8],
                "topTierWinRate" => statistics[9],
            }
            reconstructedStats.push(constructStats)
        end
            return reconstructedStats
    rescue StandardError => e
        p e
    end
    end

    def getHeroesInMetaForLowTier()
        begin
            lowTierHeroesToPlay = []
            getHeroesWithStats().each do |hero|
                if hero['lowTierWinRate'].to_f > 51
                    lowTierHeroesToPlay.push({hero["name"] => hero["lowTierWinRate"]})
                end
            end
            return lowTierHeroesToPlay.to_json
        rescue StandardError => e
            p e
        end
    end
    
    def getHeroesInMetaForBeginnerTier()
        begin
            beginnerTierHeroesToPlay = []
            getHeroesWithStats().each do |hero|
                if hero['beginnerTierWinRate'].to_f > 51
                    beginnerTierHeroesToPlay.push({hero["name"] => hero["beginnerTierWinRate"]})
                end
            end
            return beginnerTierHeroesToPlay.to_json
        rescue StandardError => e
            p e
        end
    end


    def getHeroesInMetaForIntermediateTier()
        begin
            intermediateTierHeroesToPlay = []
            getHeroesWithStats().each do |hero|
                if hero['intermediateTierWinRate'].to_f > 51
                    intermediateTierHeroesToPlay.push({hero["name"] => hero["intermediateTierWinRate"]})
                end
            end
            return intermediateTierHeroesToPlay.to_json
        rescue StandardError => e
            p e
        end
    end

    def getHeroesInMetaForTopTier()
        begin
            topTierHeroesToPlay = []
            getHeroesWithStats().each do |hero|
                if hero['topTierWinRate'].to_f > 51
                    topTierHeroesToPlay.push({hero["name"] => hero["topTierWinRate"]})
                end
            end
            return topTierHeroesToPlay.to_json
        rescue StandardError => e
            p e
        end
    end

end

#p name.map {|x| x[/\d+.\d+/]}

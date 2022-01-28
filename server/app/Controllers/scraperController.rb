require 'nokogiri'
require 'httparty'
require 'openssl'
require_relative'../Repositories/heroesRepository.rb'
class ScrapingController
    def initialize
        @userHeroes = Heroes.new() 
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

    def nameMakerForFetchingIcons()
      begin
        fixedNames = []
        normalNames = getAllHeroNames
        normalNames.map{
          |normalName|  
          fixedNames.push(normalName.downcase.gsub(" ", "-"))
         }
        c = fixedNames.index("Nature's-Prophet")
        fixedNames[c] = "natures-prophet"
        return fixedNames.to_json
      rescue StandardError => e
        p e
      end
    end
    
    def getAllHeroIcons()
      begin
      heroNameToLoop = getAllHeroNames
      heroNameToLoop.each do |heroName|
      end
      rescue StandardError => e
        p e
      end
    end
    def getHeroesWithStats()
    begin
        reconstructedStats = []
        nokogiriDoc = fileReader("https://www.dotabuff.com/heroes/meta")

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

    def constructHeroesForReturn(heroName, winRate)
        begin
            heroes = {}
                heroes["name"] = heroName
                heroes["winRate"] = winRate
            return heroes
        rescue StandardError => e
            p e
        end
    end


    def getHeroesInMetaForLowTier()
        begin
            lowTierHeroesToPlay = []
            getHeroesWithStats().each do |hero|
                if hero['lowTierWinRate'].to_f > 51
                    heroes = constructHeroesForReturn(hero["name"], hero["lowTierWinRate"])
                    lowTierHeroesToPlay.push(heroes)
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
                    heroes = constructHeroesForReturn(hero["name"], hero["beginnerTierWinRate"])
                    beginnerTierHeroesToPlay.push(heroes)
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
                    heroes = constructHeroesForReturn(hero["name"], hero["intermediateTierWinRate"])

                    intermediateTierHeroesToPlay.push(heroes)
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
                    heroes = constructHeroesForReturn(hero["name"], hero["topTierWinRate"])

                    topTierHeroesToPlay.push(heroes)
                end
            end
            return topTierHeroesToPlay.to_json
        rescue StandardError => e
            p e
        end
    end

    def getTierHeroNames(heroNames)

    begin 
        names = []
        heroNames.each do |hero|
            names.push(hero["name"])
        end
        return names

    rescue StandardError => e
        p e
    end
    end


    def getUsersHeroesAccordingToTier(query)
        begin
            if(query["tier"] === "low")
                heroesInMeta = []
                userHeroes = @userHeroes.showHeroes()
                tierData = getTierHeroNames(JSON.parse(getHeroesInMetaForLowTier()))
                userHeroes.each do |hero|
                    if tierData.include?(hero["name"])
                        heroesInMeta.push(hero["name"])
                    end
                end
                if heroesInMeta.count == 0
                    return {
                            "msg" => "Heroes you are tracking are not in the meta you could try checking other tiers or add other heroes"
                        }.to_json
                end
                return heroesInMeta
            end
            if(query["tier"] === "beginner")
                heroesInMeta = []
                userHeroes = @userHeroes.showHeroes()
                tierData = getTierHeroNames(JSON.parse(getHeroesInMetaForBeginnerTier()))
                userHeroes.each do |hero|
                    if tierData.include?(hero["name"])
                        heroesInMeta.push(hero["name"])
                    end
                end
                if heroesInMeta.count == 0
                    return {
                            "msg" => "Heroes you are tracking are not in the meta you could try checking other tiers or add other heroes"
                        }.to_json
                end
                return heroesInMeta
            end
            if(query["tier"] === "intermediate")
                heroesInMeta = []
                userHeroes = @userHeroes.showHeroes()
                tierData = getTierHeroNames(JSON.parse(getHeroesInMetaForIntermediateTier()))
                userHeroes.each do |hero|
                    if tierData.include?(hero["name"])
                        heroesInMeta.push(hero["name"])
                    end
                end
                if heroesInMeta.count == 0
                    return {
                            "msg" => "Heroes you are tracking are not in the meta you could try checking other tiers or add other heroes"
                        }.to_json
                end
                return heroesInMeta
            end
            if(query["tier"] === "top")
                heroesInMeta = []
                userHeroes = @userHeroes.showHeroes()
                tierData = getTierHeroNames(JSON.parse(getHeroesInMetaForTopTier()))
                userHeroes.each do |hero|
                    if tierData.include?(hero["name"])
                        heroesInMeta.push(hero["name"])
                    end
                end
                if heroesInMeta.count == 0
                    return {
                            "msg" => "Heroes you are tracking are not in the meta you could try checking other tiers or add other heroes"
                        }.to_json
                end
                return heroesInMeta
            end


        rescue StandardError => e
            p e
        end
    end
end

#p name.map {|x| x[/\d+.\d+/]}


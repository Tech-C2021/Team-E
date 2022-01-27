require_relative "../../Repositories/heroesRepository.rb"
require_relative "../scraperController.rb"
require "json"
class ClientHeroController
    def initialize
        @heroes = Heroes.new()
        @scrapeMethods = ScrapingController.new()
    end


    def checkIfHeroIsvalid(name)
        allHeroes = @scrapeMethods.getAllHeroNames
        return allHeroes.include?(name)
    end
#display heroes
    def displayHeroes
        begin
            return @heroes.showHeroes.to_json
        rescue StandardError => e
            p e
        end 
    end

    def displayHeroesByName(query)
        begin
            checkIfHeroExistsInDb = @heroes.showByName(query["name"])
            if checkIfHeroExistsInDb < 0 
                return "#{query["name"]} is not being tracked"
            end
            return @heroes.showHeroesByName(query["name"]).to_json
        rescue StandardError => e
            puts e
        end

    end

    def trackHeroes(query)
        begin
            checkIfExistsInDB = @heroes.showByName(query["name"])
            
            if checkIfExistsInDB.each.count > 0
                return "You are already tracking #{query["name"]}"
            end

            isValidHero = checkIfHeroIsvalid(query["name"])
            if isValidHero == false
                return "#{query["name"]} is not a Dota hero"
            end

            @heroes.heroesToTrack(query["name"])
            return "You Have started Tracking #{query["name"]}"
        rescue StandardError => e
            p e
        end
    end

    def deleteHeroByName(query)
        begin
            check = @heroes.showByName(query["name"])
            if check.each.count == 0
                return "#{query["name"]} doesn't exist"
            end
            @heroes.deleteHeroByName(query["name"])
            return "#{query["name"]} deleted"
        rescue StandardError => e
            p e
        end
    end
end



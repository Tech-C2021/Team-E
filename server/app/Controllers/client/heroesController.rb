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
                return {"msg"=>"#{query["name"]} is not being tracked"}.to_json
            end
            return @heroes.showHeroesByName(query["name"]).to_json
        rescue StandardError => e
            puts e
        end

    end

    def trackHeroes(query)
        begin
            checkIfExistsInDB = @heroes.showByName(query["name"].capitalize())
            
            if checkIfExistsInDB.each.count > 0
                return {"msg"=>"You are already tracking #{query["name"].capitalize()}"}.to_json
            end

            isValidHero = checkIfHeroIsvalid(query["name"].capitalize())
            if isValidHero == false
                return {"msg" => "#{query["name"]} is not a Dota hero"}.to_json
            end

            @heroes.heroesToTrack(query["name"].capitalize())
            return {"msg" => "You Have started Tracking #{query["name"]}"}.to_json
        rescue StandardError => e
            p e
        end
    end

    def deleteHeroByName(query)
        begin
            check = @heroes.showByName(query["name"])
            if check.each.count == 0
                return {"msg"=>"#{query["name"]} doesn't exist"}.to_json
            end
            @heroes.deleteHeroByName(query["name"])
            return {"msg" => "#{query["name"]} deleted"}.to_json
        rescue StandardError => e
            p e
        end
    end
end



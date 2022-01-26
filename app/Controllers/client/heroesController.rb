require_relative "../../Repositories/heroesRepository.rb"
require "json"
class ClientHeroController
    def initialize
        @heroes = Heroes.new()
    end
#display heroes
    def displayHeroes
        begin
            return @heroes.showHeroes.to_json
        rescue StandardError => e
            p e
        end 
    end

    def trackHeroes(query)
        begin
            check = @heroes.showByName(query["name"])
            if check.each.count > 0
                return "You are already tracking #{query["name"]}"
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



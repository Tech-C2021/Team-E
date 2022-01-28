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
        p allHeroes
        return allHeroes.include?(name)
    end
#display heroes
    def getStats(name,icon)
      begin
        stats = @scrapeMethods.getHeroesWithStats()
        stats.each do |heroInfo|
          c = heroInfo['name'].to_s.downcase
           if c == name
                heroInfo['icon']= icon
               return heroInfo
          end
        end
      rescue StandardError => e 
        p e
      end
    end
    def displayHeroes
        begin
          data = []
          heroes = @heroes.showHeroes
          heroes.each do |hero|
             data.push(getStats(hero['name'], hero['heroIcon']))
          end
          return data.to_json
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
    def nameFixer(name) 
      return name.gsub(" ","_")
    end
    def trackHeroes(query)
        begin
            checkIfExistsInDB = @heroes.showByName(query["name"])
             
            if checkIfExistsInDB.each.count > 0
                return {"msg"=>"You are already tracking #{query["name"]}"}.to_json
            end

            isValidHero = checkIfHeroIsvalid(query["name"])
            if isValidHero == false
                return {"msg" => "#{query["name"]} is not a Dota hero"}.to_json
            end
            if query["name"] == "nature's prophet"
              query["name"] = "furion"
            end
            icon = nameFixer(query['name'])
            @heroes.heroesToTrack(query["name"], @scrapeMethods.getHeroIcons(icon))

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



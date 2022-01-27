require_relative "../Repositories/heroesRepository.rb"

class HeroController
    def initialize
        @heroes = Heroes.new()
    end

#display heroes

    def displayHeroes
        if @heroes.showHeroes === []
            p "no heroes inserted"
        else
            p "List of tracked heroes"
            @heroes.showHeroes.each do |hero|
                p "id: #{hero[0]}"
                p "name: #{hero[1]}"
                p "status: #{hero[2]}"
                p "infoVersion: #{hero[3]}"
                p "heroIcon: #{hero[4]}"
            end
        end
        p "Enter track: enter Heroes to Track, show: show all the heroes in the database, byname: show heroes by id,end: to quit the programme"
    end


#create new heroes

    def insertHeroes(heroes)
        heroes.each do |hero|
            @heroes.heroesToTrack(hero)
        end
    end


#track heroes

    def insertHeroesToTrack
        p "Enter the hero name you want to track"
        p "or enter q to exit insert state"
        heroesList = []
        name = gets.chomp
        if name != "q"
            heroesList.push(name)
            insertHeroesToTrack
        end
        insertHeroes(heroesList)
        p "You have exited insert state"
    end

#showHeroByName

    def showHeroByName
        p "Enter the name of the hero you want to search for: "
        name = gets.chomp
        @heroes.showByName(name).each do |hero|
            p "id: #{hero[0]}"
            p "name: #{hero[1]}"
            p "status: #{hero[2]}"
            p "infoVersion: #{hero[3]}"
            p "heroIcon: #{hero[4]}"
        end
        p "Enter track: enter Heroes to Track, show: show all the heroes in the database, byname: show heroes by id,end: to quit the programme"
    end

#delete tracked heroes

    def deleteHeroByName
        p "Enter the name of hero you want to delete: "
        name = gets.chomp
        @heroes.deleteHeroByName(name)
        p "Enter track: enter Heroes to Track, show: show all the heroes in the database, byname: show heroes by id,end: to quit the programme"
    end

    def clearDatabase
        @heroes.clearDatabase
        p "All the database has been cleared."
    end

#help bar

    def showHelp
        p "track: enter insert mode"
        p "show: show heroes"
        p "byname: show heroes by specific name"
        p "delete: delete by name"
        p "end: quit the programme"
        p "cleardatabase: clears all the data in the database"
        p "help: show help"
    end


end

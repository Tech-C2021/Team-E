require "./app/Repositories/heroesRepository.rb"

class HeroController
    def initialize
        @heroes = Heroes.new()
    end
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

    def insertHeroes(heroes)
        heroes.each do |hero|
            @heroes.heroesToTrack(hero)
        end
    end

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

    def showHeroByName
        p "Enter the name of the hero"
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

    def showHelp
        p "track: enter insert mode"
        p "show: show heroes"
        p "end: quit the programme"
        p "help: show help"
    end


end
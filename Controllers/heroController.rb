require "./Repositories/heroesRepository.rb"

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
        p "Enter track: enter Heroes to Track, show: show all the heroes in the database,end: to quit the programme"
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
        heroesList.each do |hero|
            @heroes.heroesToTrack(hero)
        end
        p "You just ended the insert state"
        p "Enter track: enter Heroes to Track, show: show all the heroes in the database,end: to quit the programme"
    end

    def showHelp
        p "track: enter insert mode"
        p "show: show heroes"
        p "help: show help"
    end


end
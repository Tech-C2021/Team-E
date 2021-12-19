require "./app/Controllers/heroController.rb"
def commands
    p "Enter track: enter Heroes to Track, show: show all the heroes in the database,end: to quit the programme"
    command = ""
    while command != "end"
        command = gets.chomp
        heroController = HeroController.new()
        if(command == "show")
            heroController.displayHeroes
        elsif(command == "track")
            heroController.insertHeroesToTrack
        elsif(command == "help")
            heroController.showHelp
        elsif(command == "byname")
            heroController.showHeroByName
        elsif(command == "end")
            p "Bye!"
        else
            p "Command Doesnt exist use 'help' to show the commands you can use:"
        end
    end
end

commands
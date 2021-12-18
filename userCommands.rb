require "./heroesInputs.rb"

def commands
    p "Enter track: enter Heroes to Track, show: show all the heroes in the database,end: to quit the programme"
    command = ""
    while command != "end"
        command = gets.chomp
        heroes = Heroes.new()
        if(command == "show")
            p "List of tracked heroes"
            heroes.showHeroes
        elsif(command == "track")
            p "Enter the hero name you want to track"
            name = gets.chomp
                heroes.heroesToTrack(name)
                p "Enter track: enter Heroes to Track, show: show all the heroes in the database,end: to quit the programme"
        elsif(command == "help")
            p "track: enter insert mode"
            p "show: show heroes"
            p "help: show help"
        elsif(command == "end")
            p "Bye!"
        else
            p "Command Doesnt exist use 'help' to show the commands you can use:"
        end
    end
end

commands
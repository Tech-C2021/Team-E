require "sqlite3"

class Heroes
    def initialize()
        @db = SQLite3::Database.open './scrape.db'
    end

    def heroesToTrack(name)
            @db.execute "INSERT INTO heroes(name) values(?)",name
    end
    def showHeroes
        heroes = @db.execute "SELECT * FROM heroes"
        return heroes
    end
end

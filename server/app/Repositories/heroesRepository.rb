require "sqlite3"

class Heroes
    def initialize()
        @db = SQLite3::Database.open './scrape.db'
        @db.results_as_hash=true
    end

    def heroesToTrack(name)
            @db.execute "INSERT INTO heroes(name) values(?)",name
    end
    def showHeroes
        heroes = @db.execute "SELECT * FROM heroes"
        return heroes
    end
    def showByName(name)
        hero = @db.execute "SELECT * FROM heroes where name = (?)",name
        return hero
    end
    def deleteHeroByName(name)
        @db.execute ("DELETE FROM heroes where name = (?)"), name
    end
    def clearDatabase
        @db.execute ("DELETE FROM heroes")
    end
end

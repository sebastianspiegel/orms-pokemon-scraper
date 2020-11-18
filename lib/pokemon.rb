require 'pry'

class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, id:, db:)
        @name = name
        @type = type
        @id = id
        @db = db  
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.find(id_number, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?;", id_number)
        self.new(name: pokemon_info.flatten[1], type: pokemon_info.flatten[2], id: pokemon_info.flatten[0], db: db)
    end

end

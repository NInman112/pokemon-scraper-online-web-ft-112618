class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id: id, name: name, type: type, hp: hp, db: db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
      #binding.pry
    end

    def self.find(p_id, db)
      poke = db.execute("SELECT * FROM pokemon WHERE id = ?", p_id).flatten
      Pokemon.new(id: poke[0], name: poke[1], type: poke[2], hp:poke[3])
    end

    def alter_hp(new_hp, db)
      health = db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id)
      binding.pry
      damage = (health - new_hp)
      db.execute("UPDATE pokemon SET hp = (hp - ?) WHERE id = ?", damage, self.id)
      #binding.pry
    end
end

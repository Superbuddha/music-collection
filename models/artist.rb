require("pg")

class Artist
  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save ()
    db = PG.connect({ dbname: 'collection', host: 'localhost' })
# artists? artist?
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES (
      $1
    )
    RETURNING id"
    values = [@name]
    db.prepare("save", sql)
    result = db.exec_prepared("save",values)
    db.close()
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    db = PG.connect ( { dbname: 'collection', host: 'localhost'})
    sql ="DELETE FROM artists" #artist? artists?
    db.prepare("delete_all", sql)
    result = db.exec_prepared("delete_all")
    db.close()
  end
end

require('pg')

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options ['title']
    @genre = options ['genre']
    @artist_id = options ['artist_id'].to_i
  end

  def save()
    db = PG.connect( { dbname: 'collection', host: 'localhost' } )
    #albums? album?
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
    )
    VALUES (
      $1
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    # is the following causing problems with line 9? -SOLVED
    # I changed an error on that linethat suddenly solved an issue with line 3.
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    db = PG.connect({ dbname: 'collection', host:'localhost'})
    sql = "DELETE FROM albums"
    db.prepare("delete_all", sql)
    result = db.exec_prepared("delete_all")
    db.close()
  end
end

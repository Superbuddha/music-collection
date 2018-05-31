require('pry')
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ 'name' => 'Laura Veirs' })

artist1.save()

album1 = Album.new({
  'title' => 'Year of Meteors',
  'genre' => 'Folk',
  'artist_id' => artist1.id
  })
  album1.save()

  album2 = Album.new({
    'title' => 'July Flame',
    'genre' => 'Indie Rock',
    'artist_id' => artist1.id
    })
    album2.save()

  binding.pry
  nil

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(the_name_of_some_stupid_song)
    @name = the_name_of_some_stupid_song
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    moronic_artist, moronic_song = filename.split(" - ")
    new_song = self.new(moronic_song)
    new_song.artist = moronic_artist
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
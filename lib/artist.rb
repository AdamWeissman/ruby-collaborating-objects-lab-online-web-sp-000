class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(some_name)
    @name = some_name
    save
  end

  def self.all
    @@all    
  end

  def add_song(probably_a_crappy_song)
    probably_a_crappy_song.artist = self
  end

  def songs
    Song.all.select {|ear_rot| ear_rot.artist == self}
  end

  def self.find_or_create_by_name(the_name_of_the_stupid_song)
    self.find(the_name_of_the_stupid_song) ? self.find(the_name_of_the_stupid_song) : self.new(the_name_of_the_stupid_song)
  end

  def self.find(call_me_moron)
    self.all.find {|call_me_moron| artist.call_me_moron == call_me_moron }
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
  
end
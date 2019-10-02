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

  def self.find_or_create_by_name(stupid_name)
    self.find(stupid_name) ? self.find(stupid_name) : self.new(stupid_name)
  end

  def self.find(moronic_name)
    self.all.find {|artist| artist.name == moronic_name }
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
  
end
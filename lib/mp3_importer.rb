  
class MP3Importer
  attr_reader :pathway

  def initialize(road)
    @pathway = road
  end

  def files
    @files ||= Dir.glob("#{pathway}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
  end
end
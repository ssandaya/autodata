# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Song
  @@plays = 0

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays = 0
  end

  def play
    @plays += 1
    @@plays += 1
    "This sone: #{@plays} plays. Total #{@@plays} plays"
  end
  
  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
  
  attr_reader :name, :artist, :duration
  attr_writer :duration

end

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require "./trash/song"
require "./trash/karaoke"
puts "Basic Ruby"



asong = Song.new("Bicylops", "Fleck", 260)
puts asong.inspect
puts asong.to_s

a_song_k = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
puts a_song_k.to_s 
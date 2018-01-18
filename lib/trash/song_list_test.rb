# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "./trash/song_list"
require "./trash/song"

song1 = Song.new("Bicylops", "Fleck", 260)
p SongList.isTooLong(song1) #→ false
song2 = Song.new("The Calling", "Santana", 468)
p SongList.isTooLong(song2) 

person1 = "Tim"
#person1.id
#person1.type


a = [ 3.14159, "pie", 99 ]
#a.type
p a.length

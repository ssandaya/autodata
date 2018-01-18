# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require  "./trash/song"
s1 = Song.new("Song1", "Artist1", 234)  # test songs..
s2 = Song.new("Song2", "Artist2", 345)
p s1.play #→ "This song: 1 plays. Total 1 plays."
p s2.play #→ "This song: 1 plays. Total 2 plays."
p s1.play #→ "This song: 2 plays. Total 3 plays."
p s1.play #→ "This song: 3 plays. Total 4 plays."

a = [ 3.14159, "pie", 99 ]
p a
h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
p h
h1 = Hash["a", 100, "b", 200] 
p h1
h3 = Hash.new("Go Fish")
h3["a"] = 100
h3["b"] = 200
h3["a"] #→ 100
p h3["c"] #→ 'Go Fish"
p h3[0]
p h3

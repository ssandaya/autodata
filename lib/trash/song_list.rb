# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SongList
  MaxTime = 5*60           #  5 minutes

  def SongList.isTooLong(aSong)
    return aSong.duration > MaxTime
  end
end

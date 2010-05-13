# Raffle.rb
# Raffle
#
# Created by phuesler on 13.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class Raffle
  def initialize(names,delegate)
    @names = names
    @delegate = delegate
  end
  
  def raffle
    NSThread.detachNewThreadSelector(:reallyRun, toTarget: self, withObject: nil)
  end
  
  private
  
  def reallyRun
    name = nil
    1.upto(5 + rand(5)) do 
      name = @names[rand(@names.size)]
      @delegate.updateName(name)
      sleep(1)
    end
  end
end

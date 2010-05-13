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
    NSThread.detachNewThreadSelector(:run, toTarget: self, withObject: nil)
  end
  
  private
  
  def run
    name = nil
    bound = @names.size / 4
    1.upto(bound + rand(bound)) do
      name = @names[rand(@names.size)]
      @delegate.updateName(name)
      sleep(0.1)
    end
    @names.delete(name)
  end
end

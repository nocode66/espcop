class Subscriber < ActiveRecord::Base

  def self.columns 
    @columns ||= []
  end

  # ...  

end
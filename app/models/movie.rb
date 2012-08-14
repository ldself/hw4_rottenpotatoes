class Movie < ActiveRecord::Base
  
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director(id)
    d = self.find(id, :select => "director")
    if d.director == nil || d.director.length == 0
      []
    else
      self.where(:director => d.director)
    end
  end
end

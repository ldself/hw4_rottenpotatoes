class Movie < ActiveRecord::Base
  
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director(id)
    director = self.where(:id => id).select(:director).map{|c| c.director}[0].to_s
    if director.length > 0
      self.where(:director => director)
    else
      []
    end
  end
end

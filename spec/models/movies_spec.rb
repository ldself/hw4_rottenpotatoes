require 'spec_helper'

describe Movie do
  describe 'searching Movie by director' do
    fixtures :movies
    it 'should call Movie with an id of a movie that has a director listed' do
      fake_movie = movies(:star_wars_movie) #mock('movie1').stub(:director).and_return("director")
      Movie.should_receive(:find).with("1", {:select => "director"}).and_return(fake_movie)
      Movie.same_director("1")
    end
    it 'should call Movie with an id of a movie that does not have a director listed' do
      fake_movie = movies(:alien_movie)
      Movie.should_receive(:find).with("3", {:select => "director"}).and_return(fake_movie)
      Movie.same_director("3")
    end
  end
end

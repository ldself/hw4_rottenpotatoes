require 'spec_helper'

describe MoviesController do
  describe 'Find similar movies' do
    before :each do
      @fake_movie = [mock('movie1')]
      @fake_movies = [mock('movie1'), mock('movie2')]
    end
    it 'should call the model method that performs the search' do
      Movie.should_receive(:find).with("1").and_return(@fake_movie)
      Movie.should_receive(:same_director).with("1").and_return(@fake_movies)
      get :similar, {:id => "1"}
    end
    it 'should select the Similar movies template for rendering' do
      Movie.stub(:find).and_return(@fake_movie)
      Movie.stub(:same_director).and_return(@fake_movies)
      get :similar, {:id => "1"}
      response.should render_template('similar')
    end
    it 'should make the Similar movie results available to that template' do
      Movie.stub(:find).and_return(@fake_movie)
      Movie.stub(:same_director).and_return(@fake_movies)
      get :similar, {:id => "1"}
      assigns(:movie) == @fake_movie
      assigns(:movies) == @fake_movies
    end
  end  
end

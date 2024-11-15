class MoviesController < ApplicationController
  def show
    @lists = List.all
    @movie = Movie.find(params[:id])
    @related_movies = Movie.order("RANDOM()").limit(10)
  end

  def index
    @movies = Movie.all
  end
end

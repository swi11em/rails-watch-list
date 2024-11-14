class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
     puts "Create action called"
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(movie: @movie, list: @list, comment: params[:comment])

    if @bookmark.save
      redirect_to list_path(@list), notice: "Film ajouté à la liste avec succès !"
    else
      alert("Le commentaire doit contenir au moins 6 caractères.")
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

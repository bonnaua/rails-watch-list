class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie_id = params[:bookmark][:movie_id].to_i

    if @bookmark.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render "lists/show"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end


  private
  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

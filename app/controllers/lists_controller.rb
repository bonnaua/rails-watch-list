class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  # POST method for processing form data
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List added!'
      redirect_to lists_path
    else
      flash[:error] = 'Failed to edit list!'
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end

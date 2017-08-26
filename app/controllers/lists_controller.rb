class ListsController < ApplicationController

  def index
    @lists = current_user.lists
  end

  def update
    list = List.find(params[:id])
    if list.update(params.require(:list).permit(:name, :user_id))
      flash[:success] = 'List Updated!'
    else
      flash[:error] = 'List not updated!'
    end
    redirect_to :root
  end

  def create
    list = List.new(params.require(:list).permit(:name, :user_id))
    if list.save
      flash[:success] = 'List added!'
    else
      flash[:error] = 'List not added!'
    end
    redirect_to :root
  end

  def destroy
    list = List.find(params[:id])
    if list.destroy
      flash[:success] = 'List removed!'
    else
      flash[:success] = 'List not removed!'
    end
    redirect_to :root

  end

end

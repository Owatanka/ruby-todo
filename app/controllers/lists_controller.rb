class ListsController < ApplicationController

  def index
    @lists = current_user.lists
  end

  def update
    list = List.find(params[:id])
    if list.user.id == current_user.id && list.update(params.require(:list).permit(:name))
      flash[:success] = 'List Updated!'
    else
      flash[:error] = 'List not updated!'
    end
    redirect_to :root
  end

  def create
    list = List.new(params.require(:list).permit(:name, :user_id))
    if list.user.id == current_user.id && list.save
      flash[:success] = 'List added!'
    else
      flash[:error] = 'List not added!'
    end
    redirect_to :root
  end

  def destroy
    list = List.find(params[:id])
    if list.user.id == current_user.id && list.destroy
      flash[:success] = 'List removed!'
    else
      flash[:success] = 'List not removed!'
    end
    redirect_to :root

  end

end

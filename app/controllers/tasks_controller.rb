class TasksController < ApplicationController
  def create
    task = Task.new(params.require(:task).permit(:name, :deadline, :list_id, :prio))
    if task.list.user.id == current_user.id && task.save
      flash[:success] = 'Task added!'
    else
      flash[:error] = 'Task not added!'
    end
    redirect_to :root
  end

  def update
    task = Task.find(params[:id])
    if task.list.user.id == current_user.id && task.update(params.require(:task).permit(:name, :deadline, :list_id, :prio, :done))
      flash[:success] = 'Task updated!'
    else
      flash[:error] = 'List not updated!'
    end
    redirect_to :root
  end


  def destroy
    task = Task.find(params[:id])
    if task.list.user.id == current_user.id && task.destroy
      flash[:success] = 'Task removed!'
    else
      flash[:success] = 'Task not removed!'
    end
    redirect_to :root

  end
end

class TaskCompletionsController < ApplicationController

  def create
    task = Task.find(params[:task_id])
    task.done = !task.done
    task.save
    redirect_to root_path
  end

end

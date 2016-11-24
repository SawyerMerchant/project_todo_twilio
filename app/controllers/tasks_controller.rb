class TasksController < ApplicationController

  def index
     @tasks_to_do = tasks_to_do
     @tasks_done = tasks_done
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      successful_task_creation
    else
      failed_task_creation
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      successful_task_update
    else
      failed_task_update
    end
  end

  private

    def tasks_stack
      Task.order('tasks.due_date ASC').all
    end

    def tasks_to_do
      tasks_stack.select { |task| !task.done }
    end

    def tasks_done
      tasks_stack.select { |task| task.done }
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :done)
    end

    def successful_task_creation
      redirect_to @task
    end

    def failed_task_creation
      flash.now[:error] = @task.errors.full_messages
      render :new
    end

    def successful_task_update
      flash[:success] = ["Task Updated"]
      redirect_to @task
    end

    def failed_task_update
      flash.now[:error] = @task.errors.full_messages
      render :edit
    end
end

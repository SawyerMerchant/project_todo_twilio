class TasksController < ApplicationController

  def index
    @tasks = tasks_stack
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  private

    def tasks_stack
      Task.order('tasks.due_date ASC').all
    end
end


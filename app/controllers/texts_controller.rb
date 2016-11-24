
class TextsController < ApplicationController

  def create
    task = Task.find(params[:task_id])
    message = create_task_message(task)
    Notification.new.send_sms(message)
    redirect_to root_path
  end


  private

    def create_task_message(task)
      "#{ task.title }\n#{ task.due_date }\n#{ task.description }"
    end
end

class TextsController < ApplicationController

  def send_text
    message = create_task_message(params[:task])
    Notification.new.send_sms(message)
  end


  private

  def create_task_message(task_data)
    p task_data
  end

end

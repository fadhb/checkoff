module CurrentTaskList
  extend ActiveSupport::Concern
  
  private
  def set_task_list
    @task_list= TaskList.find(session[:task_list_id])
  rescue ActiveRecord::RecordNotFound
    @task_list = TaskList.create
    session[:task_list_id] = @task_list.id
  end
end
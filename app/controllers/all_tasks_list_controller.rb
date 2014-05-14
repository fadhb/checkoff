class AllTasksListController < ApplicationController
  include CurrentTaskList
  before_action :set_task_list
  def index
    @tasks = Task.order(:title)
  end
end

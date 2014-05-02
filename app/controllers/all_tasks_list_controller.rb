class AllTasksListController < ApplicationController
  def index
    @tasks = Task.order(:title)
  end
end

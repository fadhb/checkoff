class TaskItem < ActiveRecord::Base
  belongs_to :task
  belongs_to :task_list
end

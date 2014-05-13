class TaskList < ActiveRecord::Base
  has_many :task_items, dependent: :destroy
  
  def add_task(task_id)
    current_item = task_items.find_by(task_id: task_id)
    if ! current_item
      current_item = task_items.build(task_id: task_id)
    end
    current_item
  end
  
  def num_of_tasks
    task_items.count
  end
end

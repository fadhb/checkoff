class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|

      t.timestamps
    end
  end
end

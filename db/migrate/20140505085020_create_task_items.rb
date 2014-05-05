class CreateTaskItems < ActiveRecord::Migration
  def change
    create_table :task_items do |t|
      t.references :task, index: true
      t.belongs_to :task_list, index: true

      t.timestamps
    end
  end
end

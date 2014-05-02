class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.text :excerpt
      t.string :image_url
      t.integer :duration

      t.timestamps
    end
  end
end

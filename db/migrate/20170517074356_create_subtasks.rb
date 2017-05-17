class CreateSubtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :task, foreign_key: true
      t.timestamps
    end
  end
end

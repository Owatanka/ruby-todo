class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :rails
      t.string :g
      t.string :model
      t.string :Task
      t.string :name
      t.datetime :deadline
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end

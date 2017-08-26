class AddPrioToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :prio, :integer
  end
end

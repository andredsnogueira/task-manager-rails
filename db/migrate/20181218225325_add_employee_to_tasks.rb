class AddEmployeeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :employee, foreign_key: true
  end
end

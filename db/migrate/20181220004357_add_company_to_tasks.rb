class AddCompanyToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :company, foreign_key: true
  end
end

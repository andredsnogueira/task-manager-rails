class AddEmployeeToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :employee, foreign_key: true
  end
end

class AddReminderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reminder, :integer
  end

  def self.down
    remove_column :users, :reminder
  end
end

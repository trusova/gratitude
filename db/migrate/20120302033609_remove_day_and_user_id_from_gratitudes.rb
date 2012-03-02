class RemoveDayAndUserIdFromGratitudes < ActiveRecord::Migration
  def self.up
    remove_column :gratitudes, :user_id
    remove_column :gratitudes, :day
  end

  def self.down
    add_column :gratitudes, :user_id, :integer
    add_column :gratitudes, :day, :integer
  end
end

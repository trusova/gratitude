class AddDayToGratitudes < ActiveRecord::Migration
  def self.up
    add_column :gratitudes, :day_id, :integer
    add_index :gratitudes, :day_id
  end

  def self.down
    remove_index :gratitudes, :day_id
    remove_column :gratitudes, :day_id
  end
end

class AddGratitudeListToDays < ActiveRecord::Migration
  def self.up
    add_column :days, :gratitude_list_id, :integer
  end

  def self.down
    remove_column :days, :gratitude_list_id
  end
end

class AddDayToBlessings < ActiveRecord::Migration
  def self.up
    add_column :blessings, :day, :integer, :default => 1
  end

  def self.down
    remove_column :blessings, :day
  end
end

class AddShareToBlessings < ActiveRecord::Migration
  def self.up
    add_column :blessings, :share, :boolean, :default => 0
  end

  def self.down
    remove_column :blessings, :share
  end
end

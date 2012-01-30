class AddShareToBlessings < ActiveRecord::Migration
  def self.up
    add_column :blessings, :share, :boolean, :default => false
  end

  def self.down
    remove_column :blessings, :share
  end
end

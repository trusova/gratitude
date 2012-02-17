class RenameBlessingToGratitude < ActiveRecord::Migration
  def self.up
        rename_table :blessings, :gratitudes
    end 
    def self.down
        rename_table :gratitudes, :blessings
    end
end

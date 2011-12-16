class AddUserIdToBlessings < ActiveRecord::Migration
  def self.up
    add_column :blessings, :user_id, :integer
  end

  def self.down
    remove_column :blessings, :user_id
  end
end

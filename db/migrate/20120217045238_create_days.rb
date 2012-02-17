class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.boolean :is_public, :default => false
      t.integer :count, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end

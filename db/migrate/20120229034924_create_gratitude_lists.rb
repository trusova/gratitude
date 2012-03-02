class CreateGratitudeLists < ActiveRecord::Migration
  def self.up
    create_table :gratitude_lists do |t|
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :gratitude_lists
  end
end

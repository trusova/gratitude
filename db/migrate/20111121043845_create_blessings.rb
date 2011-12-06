class CreateBlessings < ActiveRecord::Migration
  def self.up
    create_table :blessings do |t|
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :blessings
  end
end

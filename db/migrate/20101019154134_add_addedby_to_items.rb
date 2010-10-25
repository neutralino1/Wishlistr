class AddAddedbyToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :addedby, :string
  end

  def self.down
    remove_column :items, :addedby
  end
end

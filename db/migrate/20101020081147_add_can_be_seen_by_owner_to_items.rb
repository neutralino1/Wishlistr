class AddCanBeSeenByOwnerToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :viewablebyowner, :boolean
  end

  def self.down
    remove_column :items, :viewablebyowner
  end
end

class AddUsernameToContributors < ActiveRecord::Migration
  def self.up
    change_table :contributors do |t|
      t.remove :user_id
      t.string :username
    end
  end

  def self.down
    change_table :contributors do |t|
      t.remove :username
      t.integer :user_id
    end
  end
end

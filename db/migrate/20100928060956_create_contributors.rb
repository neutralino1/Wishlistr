class CreateContributors < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.integer :user_id
      t.references :list

      t.timestamps
    end
  end

  def self.down
    drop_table :contributors
  end
end

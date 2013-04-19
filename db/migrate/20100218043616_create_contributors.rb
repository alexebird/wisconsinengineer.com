class CreateContributors < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.string :name
      t.text :bio
      t.references :user
      t.references :contributor_type

      t.timestamps
    end
  end

  def self.down
    drop_table :contributors
  end
end

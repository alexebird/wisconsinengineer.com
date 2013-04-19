class CreateContributorTypes < ActiveRecord::Migration
  def self.up
    create_table :contributor_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :contributor_types
  end
end

class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.references :contributor
      t.references :contributable, :polymorphic => true
    end
  end

  def self.down
    drop_table :contributions
  end
end

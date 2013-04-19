class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.references :issue
      t.string :headline
      t.string :lead
      t.text :contents
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end

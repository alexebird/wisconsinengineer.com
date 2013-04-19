class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.boolean :show, :default => false
      t.date :published
      t.references :user
      t.string :cover_caption

      # Paperclip-detected attributes
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :cover_file_size
      t.datetime :cover_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end

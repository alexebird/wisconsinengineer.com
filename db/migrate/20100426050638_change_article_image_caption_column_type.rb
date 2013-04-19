class ChangeArticleImageCaptionColumnType < ActiveRecord::Migration
  def self.up
    change_table :article_images do |t|
      t.change :caption, :text
    end
  end

  def self.down
    change_table :article_images do |t|
      t.change :caption, :string
    end
  end
end

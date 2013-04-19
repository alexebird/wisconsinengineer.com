class ChangeIssueCoverCaptionColumnType < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.change :cover_caption, :text
    end
  end

  def self.down
    change_table :issues do |t|
      t.change :cover_caption, :string
    end
  end
end

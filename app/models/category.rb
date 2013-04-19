class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false, :message => "already exists"

  def to_s
    self.name
  end
end

require 'hpricot'

class Article < ActiveRecord::Base
  belongs_to :issue
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :contributions, :as => :contributable
  has_many :contributors, :through => :contributions
  has_many :images, :class_name => "ArticleImage", :order => :ordering, :dependent => :destroy

  validates_presence_of :issue_id, :user_id

  def to_html
    # Cache the textilized text in an instance variable.
    @textiled ||= textilize(self.contents)
  end

  def contents_empty?
    self.to_html.strip.empty?
  end

  def prof_profile?
    self.categories.each { |c| c.name == "professor profile" }
  end
  
  def has_category(category_name)
    return self.categories.find(:all, :conditions => {:name => category_name} ).length != 0
  end
end

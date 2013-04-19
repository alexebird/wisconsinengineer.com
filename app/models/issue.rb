class Issue < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  belongs_to :user
  has_many :contributions, :as => :contributable#, :dependent => :destroy
  has_many :contributors, :through => :contributions

  has_attached_file :cover, :styles => {
    :small => "100x128#",
    :medium => "200x256#",
    :large => "600x768#",
    :feature => "987x200#"
  }

  validates_attachment_content_type :cover, :content_type => /image\/.+/
  validates_presence_of :user_id, :published
  validates_uniqueness_of :published
  validates_inclusion_of :show, :in => [true, false]
  
  def name(format=:long)
    format_str = case format
    when :long then "%B %Y"
    when :short then "%b%Y"
    end
    self.published.strftime(format_str)
  end

  def cover_image_tag_options
    { :id => "cover_#{self.id}", :class => "cover" }
  end

  def cover?
    self.cover.to_s != "/covers/original/missing.png"
  end

  def articles_with_category(category_name)
    articles = self.articles
    articles_subset = []
    articles.each do |article|
      cats = article.categories.find(:all, :conditions => {:name => category_name} )
      articles_subset << article unless cats.empty?
    end
    articles_subset
  end
  
  def articles_without_category(category_name)
    articles = self.articles
    articles_subset = []
    articles.each do |article|
      cats = article.categories.find(:all, :conditions => {:name => category_name} )
      articles_subset << article unless cats.empty?
    end
    articles - articles_subset
  end

  class << self
    def find_by_publish_date(month, year)
      return nil unless month && year
      Issue.first(:conditions => { :published => Date.parse("#{month} #{year}") })
    end

    def all_showing
      Issue.all(:conditions => { :show => true })
    end
  end
end

class Contributor < ActiveRecord::Base
  has_many :contributions
  has_many :issues,
    :through => :contributions,
    :source => :issue,
    :conditions => "contributions.contributable_type = 'Issue'"
  has_many :articles,
    :through => :contributions,
    :source => :article,
    :conditions => "contributions.contributable_type = 'Article'"
  has_many :article_images,
    :through => :contributions,
    :source => :article_image,
    :conditions => "contributions.contributable_type = 'ArticleImage'"
  belongs_to :user
  belongs_to :contributor_type

  validates_presence_of :contributor_type, :user_id

  class << self
    def new_photographer
      Contributor.new(:contributor_type => ContributorType.photographer)
    end
  end
end

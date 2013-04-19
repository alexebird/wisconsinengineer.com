class ContributorType < ActiveRecord::Base
  validates_presence_of :name

  class << self
    def photographer
      @_photographer_type ||= ContributorType.first(:conditions => { :name => 'photographer' })
    end

    def author
      @_author_type ||= ContributorType.first(:conditions => { :name => 'author' })
    end
  end
end

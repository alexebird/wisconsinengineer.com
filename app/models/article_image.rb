class ArticleImage < ActiveRecord::Base
  belongs_to :article
  has_many :contributions, :as => :contributable
  has_many :contributors, :through => :contributions

  has_attached_file :image, :styles => {
    :large => "1024x768>",
    :article => "320x240>",
    :feature => "328x200#",
    :wide => "657x200#",
    :full => "987x200#"
    }#,
    #:convert_options => { :feature => "-gravity North -crop 328x200+0+0",
                          #:wide => "-gravity North -crop 657x200+0+0",
                          #:full => "-gravity North -crop 987x200+0+0" }
 
  
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /image\/.+/
  validates_presence_of :article_id
  validates_numericality_of :ordering, :integer_only => true, :greater_than_or_equal_to => 0#, :allow_blank => true
end

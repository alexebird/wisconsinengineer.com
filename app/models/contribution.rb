class Contribution < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :contributable, :polymorphic => true
  belongs_to :issue, :class_name => "Issue", :foreign_key => "contributable_id"
  belongs_to :article, :class_name => "Article", :foreign_key => "contributable_id"
  belongs_to :article_image, :class_name => "ArticleImage", :foreign_key => "contributable_id"
end

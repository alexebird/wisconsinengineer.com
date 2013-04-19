module ArticleImagesHelper
  def render_article_image(article_image)
    alignment_class = (article_image.id % 2 == 0 ? 'right' : 'left')
    render :partial => 'article_images/embedded_image_and_caption',
      :locals => { :article_image => article_image, :alignment_class => alignment_class }
  end
end

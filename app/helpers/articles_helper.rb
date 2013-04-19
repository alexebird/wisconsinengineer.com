module ArticlesHelper
  def render_article_with_images(article)
    num_imgs = article.images.size
    if num_imgs == 0 || article.contents_empty?
      return article.to_html
    end
    
    # article_images_output = ""
    # # An image-only article should really have its own special view!
    # article.images.each_with_index do |img, i|
    #   article_images_output += (render_article_image img)
    # end
    # return article_images_output

    text = Hpricot(article.to_html)
    paragraphs = text.search("p")
    para_spacing = paragraphs.size / num_imgs

    # Each element in this array at position n is the number of paragraphs to
    # skip for the image in article.images at position n.  spacing_pattern.last
    # is used as the default spacing pattern.
    spacing_pattern = [0, para_spacing]
    curr_paragraph_index = 0

    article.images.each_with_index do |img,i|
      curr_paragraph_index += spacing_pattern[i] || spacing_pattern.last
      curr_paragraph = paragraphs[curr_paragraph_index] || paragraphs.last
      curr_paragraph.after(render_article_image img)
    end

    return text.to_html
  end
  
  def filter_articles_by_category(category)
    # return @articles.find_all{|article| article.categories.find_all{|category| category.name == category} != nil }
  end
end

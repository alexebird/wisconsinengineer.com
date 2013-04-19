module Admin::ArticlesHelper
  def categories_select
    options = Category.all.collect {|c| %Q[<option value='#{c.id}'>#{c.name.capitalize}</option>] }
    select_tag "category_id", options.join
  end

  def issues_select
    select("article", "issue_id", Issue.all.collect {|i| [ i.name, i.id ] })
  end
end

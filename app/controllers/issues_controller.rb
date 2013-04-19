class IssuesController < ApplicationController
  def latest
    @issue = Issue.find(:last, :order => :published, :conditions => { :show => true })
    @articles = @issue.articles
    render :action => "show", :id => @issue.id
  end

  def index
    @issues = Issue.all_showing.reverse
    render :action => "index", :layout => "static_pages"
  end

  def show
    @issue = Issue.find(params[:id])
    @articles = @issue.articles
  end
end

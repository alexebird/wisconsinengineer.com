class Admin::IssuesController < Admin::AdminController
  # GET /issues
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  def show
    @issue = Issue.find(params[:id])
    @articles = @issue.articles
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @contributor = Contributor.new_photographer
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    @contributor = @issue.contributors.first
  end

  # POST /issues
  def create
    @issue = Issue.new(params[:issue])
    @issue.user = current_user
    @contributor = Contributor.new(params[:contributor])
    @contributor.user = current_user

    if @issue.valid? && @contributor.valid?
      @issue.save
      @contributor.save
      @issue.contributors << @contributor
      flash[:notice] = 'Issue was successfully created.'
      redirect_to admin_issue_path(@issue)
    else
      render :action => "new"
    end
  end

  # PUT /issues/1
  def update
    @issue = Issue.find(params[:id])
    @contributor = @issue.contributors.first
    @issue.attributes = params[:issue]
    @contributor.attributes = params[:contributor]

    if @issue.valid? && @contributor.valid?
      @issue.save
      @contributor.save
      flash[:notice] = 'Issue was successfully updated.'
      redirect_to admin_issue_path(@issue)
    else
      render :action => "edit"
    end
  end

  # DELETE /issues/1
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    redirect_to admin_issues_path
  end
end

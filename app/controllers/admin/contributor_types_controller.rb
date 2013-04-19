class Admin::ContributorTypesController < Admin::AdminController
  # GET /contributor_types
  def index
    @contributor_types = ContributorType.all
  end

  # GET /contributor_types/1
  def show
    @contributor_type = ContributorType.find(params[:id])
  end

  # GET /contributor_types/new
  def new
    @contributor_type = ContributorType.new
  end

  # GET /contributor_types/1/edit
  def edit
    @contributor_type = ContributorType.find(params[:id])
  end

  # POST /contributor_types
  def create
    @contributor_type = ContributorType.new(params[:contributor_type])

    if @contributor_type.save
      flash[:notice] = 'ContributorType was successfully created.'
      redirect_to(@contributor_type)
    else
      render :action => "new"
    end
  end

  # PUT /contributor_types/1
  def update
    @contributor_type = ContributorType.find(params[:id])

    if @contributor_type.update_attributes(params[:contributor_type])
      flash[:notice] = 'ContributorType was successfully updated.'
      redirect_to(@contributor_type)
    else
      render :action => "edit"
    end
  end

  # DELETE /contributor_types/1
  def destroy
    @contributor_type = ContributorType.find(params[:id])
    @contributor_type.destroy

    redirect_to(contributor_types_url)
  end
end

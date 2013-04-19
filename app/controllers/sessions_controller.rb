class SessionsController < ApplicationController
  before_filter :admin_required, :only => [:destroy]

  def create
    user = User.find_by_login(params[:email], params[:password])
    session[:current_user_id] = user.id if user
    redirect_to admin_issues_path
  end

  def destroy
    reset_session
    redirect_to admin_path
  end
end

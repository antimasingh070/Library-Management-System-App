class RolesController < ApplicationController
    before_action :require_admin, except: [:index, :show]

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:notice] = "Role was successfully created"
      redirect_to @role
    else
      render 'new'
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      flash[:notice] = "Role name updated successfully"
      redirect_to @role
    else
      render 'edit'
    end
  end

  def index
    @roles = Role.paginate(page: params[:page], per_page: 5)
  end

  def show
    @roles = Role.find(params[:id])
    @books = @role.books.paginate(page: params[:page], per_page: 5)
  end
  
  private

  def role_params
    params.require(:role).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to roles_path
    end
  end
end

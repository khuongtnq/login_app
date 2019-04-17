class UsersController < ApplicationController
  skip_before_action :require_login, only: %i(new create)

  def index
    @users = User.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @users = User.where("name LIKE ?", "%#{@name}%")
    end
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def import
   @importer = User.import_file params[:file]
    redirect_to users_path, notice: "Data imported"
  end

  def create
    @user = User.new user_params
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notisce: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :password, :email, :password_confirmation
  end
#  helper_method :user_params
end
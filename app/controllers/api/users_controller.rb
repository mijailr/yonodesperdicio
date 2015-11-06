class Api::UsersController < Api::BaseController
  before_action :authenticate_with_token!, :except => [:show, :create]
  respond_to :json

  def show
    user = User.find(params[:id])
    raise ActiveRecord::RecordNotFound unless user.id == current_user.id
    respond_with user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = current_user

    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :name, :zipcode)
    end
end

class Api::UsersController < ApplicationController
  def index
    if params[:current].blank?
      @user = User.all
    else
      @user = current_user
    end

    render json: @user.to_json
  end
end

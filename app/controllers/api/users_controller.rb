class Api::UsersController < ApplicationController
  def index
    if params[:current_user].present?
      json_obj = current_user.to_json
      #json_obj[:name] = current_user.name
      render json: json_obj#.to_json
    else
      render json: User.all.to_json
    end
  end
end

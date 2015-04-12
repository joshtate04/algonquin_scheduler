class Api::CoursesController < ApplicationController
  def index
    render json: current_user.applicable_courses.to_json
  end
end

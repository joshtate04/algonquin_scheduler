class Api::CoursesController < ApplicationController
  def index
    render json: current_user.courses.to_json
  end

  def show
    @course = Course.find(params[:id])
    if @course.professor_id == current_user.id || Enrollment.where(user_id: current_user.id, course_id: @course.id).any?
      render json: @course
    else
      render status: 403
    end
  end
end

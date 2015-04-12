class Api::MeetingsController < ApplicationController
  def index
    if current_user.role == "Student"
      render json: Meeting.where(student_id: current_user.id).map{|m|
               {
                   id: m.id,
                   professor_id: m.professor_id,
                   professor_name: Professor.find(m.professor_id).name,
                   start_hour: m.start_time.strftime("%H").to_i,
                   start_minutes: (m.end_time - m.start_time)/60,
                   name: "Meeting with #{Professor.find(m.professor_id).name}",
                   label: Enrollement.where(user_id: current_user.id, course_id: m.course_id)
               }
             }.to_json
    else
      render json: Meeting.where(professor_id: current_user.id).to_json
    end
  end

  def show

  end
end

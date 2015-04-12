class SessionsController < ApplicationController
  def logout
    if user_signed_in?
      sign_out(current_user)
    end
    redirect_to "/"
  end

  def login
    begin
      @system_error = false
      user = User.authenticate(params[:username],params[:password])
      if user.nil?
        @success = false
      else
        @success = true
        sign_in(user)
      end

    rescue => e
      @message = "<strong>#{e.message}</strong><br/>" + e.backtrace.to_s
      @success = false
      @system_error = true
    end
  end
end

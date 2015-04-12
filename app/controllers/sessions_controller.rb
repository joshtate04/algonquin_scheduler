class SessionsController < ApplicationController
  def logout
    if user_signed_in?
      sign_out(current_user)
    end
    redirect_to "/"
  end
end

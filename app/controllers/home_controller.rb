class HomeController < ApplicationController
  def index
    @notes = current_user.notes.all if user_signed_in?
  end
end

class UsersController < ApplicationController
  def admin
    @users = User.all
  end
end

module Hovercard
  class UsersController < ApplicationController
    before_filter :find_user

    private

    def find_user
      @user = User.find_by_screen_name!(params[:id])
    end
  end
end
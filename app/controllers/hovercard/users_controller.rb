module Hovercard
  class UsersController < ApplicationController
    before_filter :find_user

    def hovercard
      @challenges_count  = @user.visible_challenges.count
      @submissions_count = @user.visible_submissions.count
      @awards_count      = @user.visible_awards.count
      super
    end

    private

    def find_user
      @user = User.find_by_screen_name!(params[:id])
    end
  end
end

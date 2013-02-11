module Hovercard
  class SupportsController < ApplicationController

    before_filter :authenticate_user!, :only => [:create]
    before_filter :find_challenge

    def create
      Support.user_supports_challenge(
        current_user,
        @challenge,
        level: Support::Levels::CHALLENGE
      )

      respond_to do |format|
        format.js { @challenge.reload }
      end
    end

    def delete
      if (support = current_user.support_for(@challenge)) && support.destroy
        respond_to do |format|
          format.html { redirect_to root_url, :notice => "You are no longer following this challenge." }
          format.js { @challenge.reload }
        end
      else
        redirect_to root_url, :alert => 'Something went wrong, please try again.'
      end
    end

    private

    def find_challenge
      @challenge = Challenge.find_by_id(params[:challenge_id]) if params[:challenge_id]
    end

  end
end

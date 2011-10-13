module Hovercard
  class SupportsController < ApplicationController

    before_filter :authenticate_user!, :only => [:create]
    before_filter :find_challenge

    def create
      Support.create!(:level => Support::Levels::CHALLENGE, :user => current_user, :challenge => @challenge)
      respond_to do |format|
        format.js { @challenge.reload }
      end
    end

    def delete
      if (support = current_user.supports.where(:challenge_id => @challenge).first) && support.destroy
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
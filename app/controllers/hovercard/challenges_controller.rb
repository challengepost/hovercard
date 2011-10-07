module Hovercard
  class ChallengesController < ApplicationController
    before_filter :find_challenge

    private

    def find_challenge
      @challenge = Challenge.find(params[:id])
    end
  end
end
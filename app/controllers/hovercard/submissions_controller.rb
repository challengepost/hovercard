module Hovercard
  class SubmissionsController < ApplicationController
    before_filter :find_submission

    private

    def find_submission
      @submission = Submission.find(params[:id])
    end
  end
end
module Hovercard
  class UsersController < ApplicationController
    before_filter :find_user

    def hovercard
      submission_ids = @user.all_submission_ids
      submission_ids = ['null'] if submission_ids.blank?

      @award_count = Submission.includes(:challenge, :prizes).
        joins(<<-EOF).
        join `prizes_attributions` on `submissions`.id = `prizes_attributions`.submission_id
        join `challenges` AS challenges2 on `challenges2`.id  = `submissions`.challenge_id
      EOF
      where(<<-EOF).
        `submissions`.id in (#{submission_ids.join(", ")})
          and
        `challenges2`.moderation_stage = "#{Challenge::ModerationStage::FINISHED}"
      EOF
      order("`prizes_attributions`.created_at DESC").count
      super
    end

    private

    def find_user
      @user = User.find_by_screen_name!(params[:id])
    end
  end
end
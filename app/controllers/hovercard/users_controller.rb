module Hovercard
  class UsersController < ApplicationController
    before_filter :find_user

    def hovercard
      @challenges_count = @user.supported_challenges.published.active.count
      @submissions_count = Submission.submissions_for(@user).eligible.joins(:challenge).where("challenges.submissions_published = ? and challenges.published_at is not null", true).count

      submission_ids = @user.all_submission_ids
      submission_ids = ['null'] if submission_ids.blank?

      @awards_count = Submission.includes(:challenge, :prizes).
        joins(<<-EOF).
        join `prizes_attributions` on `submissions`.id = `prizes_attributions`.submission_id
        join `challenges` AS challenges2 on `challenges2`.id  = `submissions`.challenge_id
      EOF
      where(<<-EOF).
        `submissions`.id in (#{submission_ids.join(", ")})
          and
        `challenges2`.moderation_stage = "#{Challenge::ModerationStage::FINISHED}"
      EOF
      order("`prizes_attributions`.created_at DESC").paginate(:page => 1).total_entries
      super
    end

    private

    def find_user
      @user = User.find_by_screen_name!(params[:id])
    end
  end
end

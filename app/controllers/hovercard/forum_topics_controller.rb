module Hovercard
  class ForumTopicsController < ApplicationController

    before_filter :find_forum_topic

    private

    def find_forum_topic
      @topic = ForumTopic.find(params[:id])
    end

  end
end
module Hovercard
  class UpdatesController < ApplicationController

    before_filter :find_update

    private

    def find_update
      @update = Update.find(params[:id])
    end

  end
end
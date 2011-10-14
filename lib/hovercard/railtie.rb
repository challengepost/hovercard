require "hovercard/hovercard_helper"
module Hovercard
  class Railtie < Rails::Railtie
    initializer "hovercard.hovercard_helper" do
      ActionView::Base.send :include, HovercardHelper
    end
  end
end
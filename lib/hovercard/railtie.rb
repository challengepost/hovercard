require File.expand_path "../../../app/helpers/hovercard_helper", __FILE__
module Hovercard
  class Railtie < Rails::Railtie
    initializer "hovercard.hovercard_helper" do
      ActionView::Base.send :include, HovercardHelper
    end
  end
end
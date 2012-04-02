class Hovercard::ApplicationController < ::ApplicationController
  layout false, :only => [:hovercard]

  def hovercard; end
end

Rails.application.routes.draw do

  HOVERCARD = Proc.new do |model|
    resources model, :only => [] do
      member do
        get :hovercard
      end
    end
  end

  namespace :hovercard do
    [:users, :challenges, :updates, :forum_topics, :submissions].each do |model|
      instance_exec(model, &HOVERCARD)
    end
  end
end

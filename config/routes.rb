Rails.application.routes.draw do

  @hovercard = Proc.new do |model|
    resources model, :only => [] do
      member do
        get :hovercard
      end
    end
  end

  namespace :hovercard do
    [:users, :challenges, :submissions].each do |model|
      instance_exec(model, &@hovercard)
    end

    resources :challenges, :only => [] do
      resources :supports, :only => [:create] do
        collection do
          delete :delete
        end
      end
    end
  end
end

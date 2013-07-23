ItmatArchive::Application.routes.draw do
    resources :experiments, only: [:index,:show] do
        member do
            get :record
        end
    end
    root to: redirect("/experiments")
end

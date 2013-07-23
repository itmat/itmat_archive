ItmatArchive::Application.routes.draw do
    resources :experiments, only: [:index,:show]
    root to: redirect("/experiments")
end

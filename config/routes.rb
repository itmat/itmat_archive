ItmatArchive::Application.routes.draw do
    match "/:id", to: 'experiments#show'
    root :to => 'experiments#index'
end

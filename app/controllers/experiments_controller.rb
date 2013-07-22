class ExperimentsController < ApplicationController
    def index
        if params[:query]
            @query = params[:query]
            @experiments = Experiment.search(@query).page(params[:page] || 1)
        else
            @experiments = Experiment.page(params[:page] || 1)
        end
    end
    def show
        @experiment = Experiment.find(params[:id])
    end
end

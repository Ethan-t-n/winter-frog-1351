class PlotPlantsController < ApplicationController
    def destroy
        plant = Plant.find(params[:plant_id])
        plot_plant = plant.plot_plants.find_by(plot_id: params[:plot_id])
        plot_plant.destroy
        redirect_to '/plots'
    end
end
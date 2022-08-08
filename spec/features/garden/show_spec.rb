require 'rails_helper'

RSpec.describe 'Airline show page' do
  it 'see a list of plants that have plots in that garden' do 
    garden_1 = Garden.create!(name: 'totally_organic', organic: true)
    garden_2 = Garden.create!(name: 'maybe_organic', organic: true)
    
    #plots in garden 1
    plot_1 = Plot.create!(number: "70", size: "Large", direction: "North", garden_id: garden_1.id)
    plot_2 = Plot.create!(number: "80", size: "Medium", direction: "South", garden_id: garden_1.id)
    plot_3 = Plot.create!(number: "90", size: "Small", direction: "West", garden_id: garden_1.id)

    #plots in garden 2
    plot_4 = Plot.create!(number: "60", size: "Small", direction: "East", garden_id: garden_2.id)
    plot_5 = Plot.create!(number: "50", size: "Large", direction: "North", garden_id: garden_2.id)
    
    plant_1 = Plant.create!(name: "Jalapeno", description: 'spicy', days_to_harvest: 5)
    plant_2 = Plant.create!(name: "Bell Pepper", description: 'not spicy', days_to_harvest: 4)
    plant_3 = Plant.create!(name: "Watermelon", description: 'eh', days_to_harvest: 3)

    plant_4 = Plant.create!(name: "Pumpkin", description: 'greate to carve', days_to_harvest: 365)
    plant_5 = Plant.create!(name: "Corn", description: 'they are ok', days_to_harvest: 1)
    
    plot_plant_1 = PlotPlant.create!(plot_id: plot_1.id, plant_id: plant_1.id)
    plot_plant_2 = PlotPlant.create!(plot_id: plot_2.id, plant_id: plant_2.id)
    plot_plant_3 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_3.id)
    plot_plant_4 = PlotPlant.create!(plot_id: plot_4.id, plant_id: plant_4.id)
    plot_plant_5 = PlotPlant.create!(plot_id: plot_5.id, plant_id: plant_5.id)

    visit "/gardens/#{garden_1.id}"

    expect(page).to have_content("Jalapeno")
    expect(page).to have_content("Bell Pepper")
    expect(page).to have_content("Watermelon")
    
    expect(page).to_not have_content("Pumpkin")
    expect(page).to_not have_content("Corn")
  end

  it 'lists of plants that take less than 100 days to harvest' do 
    garden_1 = Garden.create!(name: 'totally_organic', organic: true)
    garden_2 = Garden.create!(name: 'maybe_organic', organic: true)
    
    plot_1 = Plot.create!(number: "70", size: "Large", direction: "North", garden_id: garden_1.id)
    plot_2 = Plot.create!(number: "80", size: "Medium", direction: "South", garden_id: garden_1.id)
    plot_3 = Plot.create!(number: "90", size: "Small", direction: "West", garden_id: garden_1.id)
    
    plant_1 = Plant.create!(name: "Jalapeno", description: 'spicy', days_to_harvest: 5)
    plant_2 = Plant.create!(name: "Bell Pepper", description: 'not spicy', days_to_harvest: 4)
    plant_3 = Plant.create!(name: "Watermelon", description: 'eh', days_to_harvest: 3)
    plant_4 = Plant.create!(name: "Pumpkin", description: 'greate to carve', days_to_harvest: 365)
    
    
    plot_plant_1 = PlotPlant.create!(plot_id: plot_1.id, plant_id: plant_1.id)
    plot_plant_2 = PlotPlant.create!(plot_id: plot_2.id, plant_id: plant_2.id)
    plot_plant_3 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_3.id)
    plot_plant_4 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_1.id)


    visit "/gardens/#{garden_1.id}"

    # expect(page).to have_content("Jalapeno", count: 1)
    # expect(page).to have_content("Bell Pepper", count: 1)
    # expect(page).to have_content("Watermelon", count: 1)

    # expect(page).to_not have_content("Pumpkin")

    expect(page).to have_content(plant_1.name)
    expect(page).to have_content(plant_2.name)
    expect(page).to have_content(plant_3.name)
    expect(page).to have_no_content(plant_4.name)

  end
end 
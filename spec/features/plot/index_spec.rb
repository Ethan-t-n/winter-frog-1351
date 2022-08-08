require 'rails_helper'

RSpec.describe 'Plot index page' do
  it 'has a list of all the plot numbers' do 
    garden_1 = Garden.create!(name: 'totally_organic', organic: true)
    garden_2 = Garden.create!(name: 'maybe_organic', organic: true)
    garden_3 = Garden.create!(name: 'fake_garden', organic: true)
    garden_4 = Garden.create!(name: 'chemicals only garden', organic: true)

    plot_1 = Plot.create!(number: "70", size: "Large", direction: "North", garden_id: garden_1.id)
    plot_2 = Plot.create!(number: "80", size: "Medium", direction: "South", garden_id: garden_1.id)
    plot_3 = Plot.create!(number: "90", size: "Small", direction: "West", garden_id: garden_2.id)
    plot_4 = Plot.create!(number: "60", size: "Small", direction: "East", garden_id: garden_3.id)
    plot_5 = Plot.create!(number: "50", size: "Large", direction: "North", garden_id: garden_4.id)

    visit '/plots'

    expect(page).to have_content("70")
    expect(page).to have_content("80")
    expect(page).to have_content("90")
    expect(page).to have_content("60")
    expect(page).to have_content("50")
  end
  it 'has the names for all the plot plants' do 
    garden_1 = Garden.create!(name: 'totally_organic', organic: true)
    garden_2 = Garden.create!(name: 'maybe_organic', organic: true)
    garden_3 = Garden.create!(name: 'fake_garden', organic: true)
    garden_4 = Garden.create!(name: 'chemicals only garden', organic: true)

    plot_1 = Plot.create!(number: "70", size: "Large", direction: "North", garden_id: garden_1.id)
    plot_2 = Plot.create!(number: "80", size: "Medium", direction: "South", garden_id: garden_1.id)
    plot_3 = Plot.create!(number: "90", size: "Small", direction: "West", garden_id: garden_2.id)
    plot_4 = Plot.create!(number: "60", size: "Small", direction: "East", garden_id: garden_3.id)
    plot_5 = Plot.create!(number: "50", size: "Large", direction: "North", garden_id: garden_4.id)

    plant_1 = Plant.create!(name: "Jalapeno", description: 'spicy', days_to_harvest: 5)
    plant_2 = Plant.create!(name: "Bell Pepper", description: 'not spicy', days_to_harvest: 4)
    plant_3 = Plant.create!(name: "Watermelon", description: 'eh', days_to_harvest: 3)
    plant_4 = Plant.create!(name: "Pumpkin", description: 'greate to carve', days_to_harvest: 2)
    plant_5 = Plant.create!(name: "Corn", description: 'they are ok', days_to_harvest: 1)


    plot_plant_1 = PlotPlant.create!(plot: plot_1, plant: plant_1)
    plot_plant_2 = PlotPlant.create!(plot: plot_3, plant: plant_3)
    plot_plant_3 = PlotPlant.create!(plot: plot_4, plant: plant_4)
    plot_plant_4 = PlotPlant.create!(plot: plot_5, plant: plant_5)

    visit '/plots'

    within "#plot-#{plot_1.id}" do 
      expect(page).to have_content(plant_1.name)
    end

    within "#plot-#{plot_3.id}" do 
      expect(page).to have_content(plant_3.name)
    end

    within "#plot-#{plot_4.id}" do 
      expect(page).to have_content(plant_4.name)
    end

    within "#plot-#{plot_5.id}" do 
      expect(page).to have_content(plant_5.name)
    end
  end

  it 'has the name of the garden for each plot' do 
    garden_1 = Garden.create!(name: 'totally_organic', organic: true)
    garden_2 = Garden.create!(name: 'maybe_organic', organic: true)
    garden_3 = Garden.create!(name: 'fake_garden', organic: true)
    garden_4 = Garden.create!(name: 'chemicals only garden', organic: true)

    plot_1 = Plot.create!(number: "70", size: "Large", direction: "North", garden_id: garden_1.id)
    plot_2 = Plot.create!(number: "80", size: "Medium", direction: "South", garden_id: garden_1.id)
    plot_3 = Plot.create!(number: "90", size: "Small", direction: "West", garden_id: garden_2.id)
    plot_4 = Plot.create!(number: "60", size: "Small", direction: "East", garden_id: garden_3.id)
    plot_5 = Plot.create!(number: "50", size: "Large", direction: "North", garden_id: garden_4.id)

    visit '/plots'

    within "#plot-#{plot_1.id}" do 
      expect(page).to have_content("totally_organic")
    end

    within "#plot-#{plot_2.id}" do 
      expect(page).to have_content("totally_organic")
    end

    within "#plot-#{plot_3.id}" do 
      expect(page).to have_content("maybe_organic")
    end

    within "#plot-#{plot_4.id}" do 
      expect(page).to have_content("fake_garden")
    end

    within "#plot-#{plot_5.id}" do 
      expect(page).to have_content("chemicals only garden")
    end
  end
  it 'can delete a plant from a specfic plot' do 
    garden_1 = Garden.create!(name: 'totally_organic', organic: true)
    garden_2 = Garden.create!(name: 'maybe_organic', organic: true)
    garden_3 = Garden.create!(name: 'fake_garden', organic: true)
    garden_4 = Garden.create!(name: 'chemicals only garden', organic: true)

    plot_1 = Plot.create!(number: "70", size: "Large", direction: "North", garden_id: garden_1.id)
    plot_2 = Plot.create!(number: "80", size: "Medium", direction: "South", garden_id: garden_1.id)
    plot_3 = Plot.create!(number: "90", size: "Small", direction: "West", garden_id: garden_2.id)
    plot_4 = Plot.create!(number: "60", size: "Small", direction: "East", garden_id: garden_3.id)
    plot_5 = Plot.create!(number: "50", size: "Large", direction: "North", garden_id: garden_4.id)

    plant_1 = Plant.create!(name: "Jalapeno", description: 'spicy', days_to_harvest: 5)
    plant_2 = Plant.create!(name: "Bell Pepper", description: 'not spicy', days_to_harvest: 4)
    plant_3 = Plant.create!(name: "Watermelon", description: 'eh', days_to_harvest: 3)
    plant_4 = Plant.create!(name: "Pumpkin", description: 'greate to carve', days_to_harvest: 2)
    plant_5 = Plant.create!(name: "Corn", description: 'they are ok', days_to_harvest: 1)


    plot_plant_1 = PlotPlant.create!(plot: plot_1, plant: plant_1)
    plot_plant_2 = PlotPlant.create!(plot: plot_3, plant: plant_3)
    plot_plant_3 = PlotPlant.create!(plot: plot_4, plant: plant_4)
    plot_plant_4 = PlotPlant.create!(plot: plot_5, plant: plant_5)

    visit '/plots'
   
    within "#plot-#{plot_1.id}" do 
      expect(page).to have_button('Remove from Plot')
      click_on 'Remove from Plot'
    end

    expect(current_path).to eq("/plots")

    within "#plot-#{plot_1.id}" do 
      expect(page).to_not have_content(plant_1.name)
    end
  end
end
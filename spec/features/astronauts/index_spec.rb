require 'rails_helper'

RSpec.describe 'astronauts index page' do
  it 'can display astronaut attributes' do
    astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 80, job: 'Commander')
    astronaut2 = Astronaut.create!(name: 'John Hudson', age: 20, job: 'Programmer')

    visit '/astronauts'

    expect(page).to have_content(astronaut1.name)
    expect(page).to have_content(astronaut1.age)
    expect(page).to have_content(astronaut1.job)
    expect(page).to have_content(astronaut2.name)
    expect(page).to have_content(astronaut2.age)
    expect(page).to have_content(astronaut2.job)
  end

  it 'can return average each of astronauts' do
    astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 80, job: 'Commander')
    astronaut2 = Astronaut.create!(name: 'John Hudson', age: 20, job: 'Programmer')

    visit '/astronauts'

    expect(Astronaut.average_age).to eq(50)
    expect(page).to have_content(Astronaut.average_age)
  end

  it 'can return each space mission by alphabetical order' do
    astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 80, job: 'Commander')
    astronaut2 = Astronaut.create!(name: 'John Hudson', age: 20, job: 'Programmer')
    mission1 = Mission.create!(title: "Apollo 13", time_in_space: "2 years")
    mission2 = Mission.create!(title: "Hudson's Mission", time_in_space: "1 year")
    astro1 = AstronautMission.create!(astronaut_id: 1, mission_id: 1)
    astro2 = AstronautMission.create!(astronaut_id: 2, mission_id: 2)

    visit '/astronauts'

    expect(page).to have_content("Missions")

  end

end

# User Story 3 of 4
#
# As a visitor,
# When I visit '/astronauts'
# I see a list of the space missions' in alphabetical order for each astronaut.
#
# (e.g "Apollo 13"
#      "Capricorn 4"
#      "Gemini 7")
# ```

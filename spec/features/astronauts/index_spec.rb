require 'rails_helper'

RSpec.describe 'astronaut index page' do
  it 'can display astronauts and their associated attributes' do
    astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    astronaut2 = Astronaut.create!(name: 'Saryn', age: 28, job: 'Programmer')

    visit '/astronauts'

    expect(page).to have_content("#{astronaut1.name}")
    expect(page).to have_content("#{astronaut1.age}")
    expect(page).to have_content("#{astronaut1.job}")

    expect(page).to have_content("#{astronaut2.name}")
    expect(page).to have_content("#{astronaut2.age}")
    expect(page).to have_content("#{astronaut2.job}")

  end
end

# User Story 1 of 4
#
# As a visitor,
# When I visit '/astronauts'
# I see a list of astronauts with the following info:
# - Name
# - Age
# - Job
#
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander")

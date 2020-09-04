require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'missions' do
    it 'can return each space mission by alphabetical order' do
      astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 80, job: 'Commander')
      astronaut2 = Astronaut.create!(name: 'John Hudson', age: 20, job: 'Programmer')
      mission1 = Mission.create!(title: "Apollo 13", time_in_space: "2 years")
      mission2 = Mission.create!(title: "Hudson's Mission", time_in_space: "1 year")
      astro1 = AstronautMission.create!(astronaut_id: 1, mission_id: 1)
      astro2 = AstronautMission.create!(astronaut_id: 2, mission_id: 2)

      visit '/astronauts'

      expect(Astronaut.mission_order).to eq(["Apollo 13", "Hudson's Mission"])
    end
  end
end

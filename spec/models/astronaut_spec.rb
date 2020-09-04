require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  it 'can return average age of each astronaut' do
    astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 80, job: 'Commander')
    astronaut2 = Astronaut.create!(name: 'John Hudson', age: 20, job: 'Programmer')

    visit '/astronauts'

    expect(Astronaut.average_age).to eq(50)
  end
end

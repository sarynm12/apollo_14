class Astronaut < ApplicationRecord

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions
  validates_presence_of :name, :age, :job

  def self.average_age
    Astronaut.average(:age)
  end

  def self.mission_order
    Mission.order(:title).pluck(:title)
  end

end

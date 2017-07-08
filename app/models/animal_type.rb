class AnimalType < ApplicationRecord
	has_many :animals
	validates :nombre, presence: true
end

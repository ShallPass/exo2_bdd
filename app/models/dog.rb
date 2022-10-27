class Dog < ApplicationRecord
    has_many :strolls
    belongs_to :city
    has_many :dogsitters, through: :strolls
end

class Dogsitter < ApplicationRecord
    has_many :strolls
    belongs_to :city
    has_many :dogs, through: :strolls
end

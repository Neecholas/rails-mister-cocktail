class Dose < ApplicationRecord
  validates_uniqueness_of :ingredient, scope: :cocktail
  belongs_to :ingredient
  belongs_to :cocktail
end

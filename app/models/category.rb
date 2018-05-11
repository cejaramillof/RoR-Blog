class Category < ApplicationRecord
  has_many :has_categories
  has_many :posts, through: :has_categories
  enum kind: [:motivacion, :recuperacion, :nutricion, :entrenamiento]
end

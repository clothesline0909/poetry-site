class Poem < ApplicationRecord

  # ASSOCIATIONS

  belongs_to :author

  # VALIDATIONS

  validates :title, presence: true
  validates :author, presence: true
  validates :year, presence: true
  validates :text, presence: true
  
end
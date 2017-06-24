class Author < ApplicationRecord

  # ASSOCIATIONS

  has_many :poems, dependent: :destroy

  # VALIDATIONS

  validates :name, presence: true, uniqueness: true
  validates :biography, presence: true

end
class Author < ApplicationRecord

  # ASSOCIATIONS

  has_many :poems

  # VALIDATIONS

  validates :name, presence: true, uniqueness: true
  validates :biography, presence: true

end
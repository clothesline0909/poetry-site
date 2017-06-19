class Author < ApplicationRecord

  # VALIDATIONS

  validates :name, uniqueness: true

end
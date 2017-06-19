require 'rails_helper'

RSpec.describe Author, type: :model do

  # ASSOCIATIONS

  it { should have_many :poems }

  # LAZY-LOADED OBJECTS

  let(:author) { create :author }

  # SPEC
  
end
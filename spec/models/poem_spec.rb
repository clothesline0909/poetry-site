require 'rails_helper'

RSpec.describe Poem, type: :model do

  # ASSOCIATIONS

  it { should belong_to :author }

  # LAZY-LOADED OBJECTS

  let(:poem) { create :poem }

  # SPEC
  
end
class Poem < ApplicationRecord

  # INCLUDES

  #include Statesman::Adapters::ActiveRecordQueries

  # ASSOCIATIONS

  belongs_to :author

  # VALIDATIONS

  validates :title, presence: true
  validates :year, presence: true
  validates :text, presence: true

  # PUBLIC METHODS

  delegate :current_state, :allowed_transitions, to: :state_machine

  def state_machine
    @state_machine ||= PoemStateMachine.new(self)
  end
  
end
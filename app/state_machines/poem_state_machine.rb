class PoemStateMachine

  # INCLUDES

  include Statesman::Machine

  # STATES

  state :draft, initial: true
  state :published

  # TRANSITIONS

  transition from: :draft, to: :published
  transition from: :published, to: :draft

end
# frozen_string_literal: true

# Generate a dropdown for the navbar
class Navbar::DropdownComponent < ViewComponent::Base
  delegate :heroicon, to: :helpers

  def initialize(label:, chevron: false)
    @label = label
    @chevron = chevron
  end
end

# frozen_string_literal: true

class FooterComponent < ViewComponent::Base
  def initialize(footer:)
    @footer = footer
  end

end

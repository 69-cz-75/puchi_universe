# frozen_string_literal: true

class LoginButtonComponent < ViewComponent::Base
  def initialize(loginbutton:)
    @loginbutton = loginbutton
  end
end

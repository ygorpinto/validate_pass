# frozen_string_literal: true

require_relative "validate_pass/version"

module ValidatePass
  class Error < StandardError; end
  def initialize(pass)

    @pass = pass
    validate(@pass)
  end
  def validate(password)

    is_valid = false

    expression = /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[*\-!$@#\^%])[A-Za-z\d*\-!$@#\^%]{8,}$/

    is_valid = true if (password =~ expression) == 0
  end
end

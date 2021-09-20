# frozen_string_literal: true

require_relative "validate_pass/version"

module ValidatePass
  class IsValid
    attr_reader :password

    def validate(password)
      is_valid = false

      expression = /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[*\-!$@#\^%])[A-Za-z\d*\-!$@#\^%]{8,}$/

      is_valid = true if (password =~ expression) == 0

      is_valid
    end
  end
end

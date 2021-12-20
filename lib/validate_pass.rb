# frozen_string_literal: true

require_relative "validate_pass/version"

module ValidatePass
  class IsValid
    attr_reader :password

    def initialize(pass, max_allowed_dup = 2, max_allowed_seq = 2)
      @password = pass
      @max_allowed_dup = max_allowed_dup
      @max_allowed_seq = max_allowed_seq
    end

    def validate
      is_valid = false
      expression = /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[*\-!$@#\^%])[A-Za-z\d*\-!$@#\^%]{8,}$/
      is_valid = true if (@password =~ expression) == 0
      is_valid = is_valid && !has_duplicated(@password) && !has_sequential(@password)
      return is_valid
    end

    def has_sequential(password)
      max_allowed_sequential = 2
      expression = /[0-9]/
      result = false
      count = 0
      i = 1
      while i < password.length() do
        if password[i - 1] =~ expression && password[i] =~ expression
          a = password[i]
          b = password[i - 1]
          if a.to_i - b.to_i == 1
            count += 1
            return true if count > max_allowed_sequential.to_i
          else
            count = 0
          end
        else
          count = 0
        end
        i += 1
      end
      return result
    end

    def has_duplicated(password)
      max_allowed_duplicated = 2
      result = false
      count = Hash.new(0)
      i = 0
      while i < password.length() do
        count[password[i]] += 1
        return true if count[password[i]] > max_allowed_duplicated.to_i

        i += 1
      end
      return result
    end
  end
end

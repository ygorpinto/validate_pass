# frozen_string_literal: true

RSpec.describe ValidatePass do
  it "has a version number" do
    expect(ValidatePass::VERSION).not_to be nil
  end
  it "is a valid password" do
    expect(ValidatePass::IsValid.new.validate("NGz!08cj%aL")).to be true
  end
  it "is not a valid password, missing special and dont have capital letter" do
    expect(ValidatePass::IsValid.new.validate("amor12345")).to be false
  end
  it "is not a valid password, special chat missing" do
    expect(ValidatePass::IsValid.new.validate("Amor4cjS83")).to be false
  end
  it "is not a valid password, have more than 2 duplicated characters" do
    expect(ValidatePass::IsValid.new.validate("Aotttabbbssssr4@cjS83")).to be false
  end
end

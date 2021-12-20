# frozen_string_literal: true

RSpec.describe ValidatePass do
  it "has a version number" do
    expect(ValidatePass::VERSION).not_to be nil
  end
  it "is a valid password" do
    expect(ValidatePass::IsValid.new("NGz!08cj%aL").validate).to be true
  end
  it "is not a valid password, missing special and dont have capital letter" do
    expect(ValidatePass::IsValid.new("amor12345").validate).to be false
  end
  it "is not a valid password, special chat missing" do
    expect(ValidatePass::IsValid.new("Amor4cjS83").validate).to be false
  end
  it "is not a valid password, have more than 2 duplicated characters" do
    expect(ValidatePass::IsValid.new("Aotttabbbssssr4@cjS83").validate).to be false
  end
  it "is not a valid password, have sequential numbers" do
    expect(ValidatePass::IsValid.new("NGz!08cj%aL1234").validate).to be false
  end
end

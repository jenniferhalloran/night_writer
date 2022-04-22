require './spec/spec_helper'

RSpec.describe Dictionary do
  let(:dictionary) {Dictionary.new}


  it "exists" do
    expect(dictionary).to be_a(Dictionary)
  end

  it "has a dictionary of english letter to braille" do
    expect(dictionary.translations.class).to eq(Hash)
  end

  it "can translate the given letter" do
    expect(dictionary.translations["a"]).to eq(["O.", "..", ".."])
    expect(dictionary.translations["d"]).to eq(["OO", ".O", ".."])
  end
end

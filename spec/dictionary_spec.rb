require './spec/spec_helper'

RSpec.describe Dictionary do
  let(:dictionary) {Dictionary.new}


  it "exists" do
    expect(dictionary).to be_a(Dictionary)
  end

  it "has a dictionary of english letter to braille" do
    expect(dictionary.letters.class).to eq(Hash)
  end
end
